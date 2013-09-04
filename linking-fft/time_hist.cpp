#include "../utils/TimeStamp.hh"
#include "../pyplot/pyhist.hh"
#include "fft_mkl.hh"
#include <mkl.h>

/*
 * n = size of fft
 * count = num of ffts
 * cyc_list[i] = number of cycles used by i-th fft
 */
void cyclelist(int n, int count, double cyc_list[]){
	fft_mkl fft(n);
	long bytes = 1l*(2*n)*count*sizeof(double);
	double *space = (double *)MKL_malloc(bytes, 64);
	for(int i=0; i < count; i++){
		double *v = space + i*(2*n);
		for(int j=0; j < n; j++){ //"random" and cheap
			v[2*j] = 1.0/(1.0 + i +j);
			v[2*j+1] = 1.0/(1.0+i*j);
		}
	}

	TimeStamp clk;
	for(int i=0; i < count; i++){
		double *v = space + i*(2*n);
		clk.tic();
		fft.bwd(v);
		cyc_list[i] = clk.toc();
	}

	MKL_free(space);
}

/*
 * move all entries of cyc_list[] within window to the front of the list
 * return count of number of entries within window
 */
int window(double *cyc_list, int len, 
	   double window_begin, double window_end){
	/*
	 * first pos in cyc_list[] beyond windowed entries
	 */
	int current = 0;
	for(int i=0; i < len; i++){
		if(window_begin <= cyc_list[i] &&
		   cyc_list[i] <= window_end){
			double tmp = cyc_list[current];
			cyc_list[current] = cyc_list[i];
			cyc_list[i] = tmp;
			current++;
		}
	}
	return current;
}

/*
 * n = size of fft
 * count = number of ffts timed
 * bins = number of bins for histogram
 * window_begin/end = fft times are windowed using these parameters
 */
void makehist(int n, int count, int bins,
	      double window_begin, double window_end,
	      const char* name){
	double *cyc_list = new double[count];
	
	cyclelist(n, count, cyc_list);
	int wcount = window(cyc_list, count, window_begin, window_end);

	PyHist hist(name, PIPE_OFF);
	hist.hist(cyc_list, wcount);
	hist.bins(bins);
	
	char title[200];
	sprintf(title, "n = %d, total trials = %d", n, count);
	hist.title(title);
	
	hist.show();
	hist.savescript();
	delete[] cyc_list;
} 

int main(){
	makehist(1024, 1000*1000, 500,
		 18000, 24000, "fft1");
	makehist(1024, 1000*1000, 4000,
		 18000, 36000, "fft2");
	makehist(1024, 1000*1000, 10000,
		 18000, 50000, "fft3");
}
