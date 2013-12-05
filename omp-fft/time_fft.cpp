#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "fft_thrd.hh"
#include <cmath>
#include <omp.h>

/*
 * returns num of cycles per fft of size n using nth threads
 * num cycles normalized by n*lg(n)
 */
double time(int n, int nth){
	long nbytes = 16l*1000*1000*1000;
#ifdef __MIC__
	nbytes /= 16;
#endif
	long count = nbytes/(16*n);
	std::cout<<"      n = "<<n<<std::endl;
	std::cout<<" nbytes = "<<nbytes<<std::endl;
	double *v = (double *)_mm_malloc(nbytes, 64);

	fft_thrd fft(n, count, nth);
	fft.numa_init(v);
	
	TimeStamp clk;
	int scnt = 10;
	StatVector stats(scnt);

	for(int i=0; i < scnt; i++){
		clk.tic();
		fft.fwd(v);
		double cycles = clk.toc();
		stats.insert(cycles);
		clk.toc();
	}

	_mm_free(v);
	double ans = stats.median()/count/(n*log(1.0*n)/log(2.0));
	return ans;
}

int main(){
	kmp_set_defaults("KMP_AFFINITY=compact");
	const char* rows[3] = {"64", "1024", "8192"};
	int n[3] = {64, 1024, 8192};
	
	#ifdef __MIC__
	assrt(getenv("MIC_OMP_NUM_THREADS") != NULL);
	const int nthreads = atoi(getenv("MIC_OMP_NUM_THREADS"));
#else
	assrt(getenv("OMP_NUM_THREADS") != NULL);
	const int nthreads = atoi(getenv("OMP_NUM_THREADS"));
#endif
	const char* cols[1] = {"max threads"};
	int nth[1] = {nthreads};
	double data[3];

	for(int i=0; i < 3; i++)
		for(int j=0; j < 1; j++)
			data[i+j*3] = time(n[i], nth[j]);
	
	verify_dir("DBG");
	link_cout("DBG/time_fft.txt");

	Table tbl;
	tbl.dim(3, 1);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("\tnumber of cycles per fft\n"
		  "\tnmlzd by nlgn\n"
		  "\t1/16GB data");

	unlink_cout();
}
