#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "transpose.hh"
#include <mkl.h>

struct rval_struct{
	int m;
	double bw; /* in bytes per cycle */
};

/*
 * transpose m x m matrix and return m and bw (as bytes/cycle)
 */
struct rval_struct time(int nthreads){
	int m = 100*100*4;//8*1.6 = 12.8 GB matrix
	m = m/(B*nthreads)*B*nthreads;
	assrt(m > 0);
	int n = m;
	double *a = (double *)MKL_malloc(1l*m*n*sizeof(double), 64);
	double *b = (double *)MKL_malloc(1l*m*n*sizeof(double), 64);

	blocktrans(a, b, m, n, nthreads);//numa awareness
	for(int i=0; i < m*n; i++)
		a[i] = 0;

	int count = 10;
	StatVector stats(count);
	TimeStamp clk;
	for(int i=0; i < count; i++){
		clk.tic();
		blocktrans(a, b, m, n, nthreads);
		double cycles = clk.toc();
		stats.insert(cycles);
	}

	MKL_free(a);
	MKL_free(b);

	struct rval_struct rval;
	rval.m = m;
	rval.bw = 16.0*m*n/stats.median();
	
	return rval;
}

int main(){
	const char *rows[12] = {"1", "2", "3", "4", "5", "6",
				"7", "8", "9", "10", "11", "12"};
	const char* cols[2] = {"m", "bytes/cycle"};
	double data[24];

	for(int i=0; i < 12; i++){
		int nth = i + 1;
		struct rval_struct rval;
		rval = time(nth);
		data[i] = rval.m;
		data[i+12] = rval.bw;
	}

	verify_dir("DBG");
	char fname[200];
	sprintf(fname, "DBG/time_trans_B%d.txt", B);
	link_cout(fname);

	Table tbl;
	tbl.dim(12, 2);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	std::cout<<"B = "<<B<<std::endl;
	tbl.print("bw in trans of mxm matrix using 1 to 12 threads");

	unlink_cout();
}
