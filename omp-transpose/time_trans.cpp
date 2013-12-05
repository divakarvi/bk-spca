#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "transpose.hh"
#include <omp.h>

struct rval_struct{
	int m;
	double bw; /* in bytes per cycle */
};

/*
 * transpose m x m matrix and return m and bw (as bytes/cycle)
 */
struct rval_struct time(int nthreads){
	/*
	 * 12.8 GB is too big for lonestar
	 */
	//int m = 100*100*4;//8*1.6 = 12.8 GB matrix
	int m = 100*100*2;//8*0.4 = 12.8/4 = 3.2 GB matrix
	m = m/(B*nthreads)*B*nthreads;
	std::cout<<"       B = "<<B<<std::endl;
	std::cout<<"nthreads = "<<nthreads<<std::endl;
	std::cout<<"       m = "<<m<<std::endl;
	assrt(m > 0);
	int n = m;
	double *a = (double *)_mm_malloc(1l*m*n*sizeof(double), 64);
	double *b = (double *)_mm_malloc(1l*m*n*sizeof(double), 64);

	blocktrans(a, b, m, n, nthreads);//numa awareness
	for(int i=0; i < m*n; i++)
		b[i] = a[i] = 0;

	int count = 10;
	StatVector stats(count);
	TimeStamp clk;
	for(int i=0; i < count; i++){
		clk.tic();
		blocktrans(a, b, m, n, nthreads);
		double cycles = clk.toc();
		stats.insert(cycles);
	}

	_mm_free(a);
	_mm_free(b);

	struct rval_struct rval;
	rval.m = m;
	rval.bw = 16.0*m*n/stats.median();
	
	return rval;
}

int main(){
	kmp_set_defaults("KMP_AFFINITY=compact");

#ifdef __MIC__
	assrt(getenv("MIC_OMP_NUM_THREADS") != NULL);
	const int nthreads = atoi(getenv("MIC_OMP_NUM_THREADS"));
#else
	assrt(getenv("OMP_NUM_THREADS") != NULL);
	const int nthreads = atoi(getenv("OMP_NUM_THREADS"));
#endif	

	/*
	 * B <= 80 with 244 threads
	 */
	const char *rows[3] = {"25", "50", "75"};
	int BB[3] = {25, 50, 75};
	const char* cols[2] = {"m", "bytes/cycle"};
	double data[6];

	for(int i=0; i < 3; i++){
		B = BB[i];
		struct rval_struct rval;
		rval = time(nthreads);
		data[i] = rval.m;
		data[i+3] = rval.bw;
	}

	verify_dir("DBG");
	char fname[200];
	sprintf(fname, "DBG/time_trans.txt");
	link_cout(fname);

	Table tbl;
	tbl.dim(3, 2);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	char banner[200];
	sprintf(banner, "bw of matrix trans, nthreads = %d", nthreads);
	tbl.print(banner);

	unlink_cout();
}
