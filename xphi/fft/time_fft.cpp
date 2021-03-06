#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/Table.hh"
#include "fft.hh"
#include <omp.h>
#include <cmath>


/*
 * Returns median number of cycles for an FFT of size n with count.
 */
double time_fft(int n, long count){
	int stat_count = 20;
	long nbytes = 8l*2*n*count;
	double *v = (double *)_mm_malloc(nbytes, 64);
	
	FFT fft(n, count);
	fft.fwd(v); //Initializes for non-unif memory access on host.

#pragma omp parallel for				
	for(long i=0; i < 2*n*count; i++)
		v[i] = (i+6.0)/77.0;

	StatVector stats(stat_count);
	TimeStamp clk;
	for(int i=0; i < stat_count; i++){
		clk.tic();
		fft.fwd(v);
		double cycles = clk.toc();
		stats.insert(cycles);
	}

	_mm_free(v);
	return stats.median();
}

int main(){
	const char* rows[4] = {"64", "1024", "8192", "8192*8192"};
	int n[4] = {64, 1024, 8192, 8192*8192};
	long N = 250*1000*1000; /* N*16 = 4GB */
	long count[4] = {N/64, N/1024, N/8192, N/8192/8192};
	const char* cols[2] = {"nlg2n nmlzd", "cycs/byte"};
	double data[8];

	double fac = 1.0;
#ifdef __MIC__
	fac = 2.7/1.1;
#endif
	for(int i=0; i < 4; i++){
		std::cout<<i<<std::endl;
		double cycles = time_fft(n[i], count[i]);
		data[i] = cycles/(count[i]*n[i]*log(n[i]*1.0)/log(2.0))*fac;
		data[i+4] = cycles/(16.0*n[i]*count[i])*fac;
	}

	verify_dir("DBG");
#ifdef __MIC__
	link_cout("DBG/time_fft_mic.txt");
#else
	link_cout("DBG/time_fft_host.txt");
#endif
	Table tbl;
	tbl.dim(4, 2);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("c2c FFT cost in cycles");
	
	unlink_cout();
}

