#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "fft_thrd.hh"
#include <mkl.h>
#include <cmath>
/*
 * returns num of cycles per fft of size n using nth threads
 * num cycles normalized by n*lg(n)
 */
double time(int n, int nth){
	long nbytes = 16l*1000*1000*1000;
	long count = nbytes/(16*n);
	double *v = (double *)MKL_malloc(nbytes, 64);

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

	MKL_free(v);
	double ans = stats.median()/count/(n*log(1.0*n)/log(2.0));
	return ans;
}

int main(){
	const char* rows[3] = {"64", "1024", "8192"};
	int n[3] = {64, 1024, 8192};
	const char* cols[5] = {"1", "2", "4", "8", "12"};
	int nth[5] = {1, 2, 4, 8, 12};
	double data[15];

	for(int i=0; i < 3; i++)
		for(int j=0; j < 5; j++)
			data[i+j*3] = time(n[i], nth[j]);
	
	verify_dir("DBG");
	link_cout("DBG/time_fft.txt");

	Table tbl;
	tbl.dim(3, 5);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("\tnumber of cycles per fft\n"
		  "\t1 to 12 threads\n"
		  "\tnmlzd by nlgn\n"
		  "\t16GB data");

	unlink_cout();
}
