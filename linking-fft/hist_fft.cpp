#include "../utils/TimeStamp.hh"
#include "../pyplot/pyhist.hh"
#include "fft_mkl.hh"

/*
 * n = size of fft
 * count = num of ffts
 * cyc_list[i] = number of cycles used by i-th fft
 */
void cyclelist(int n, int count, double cyc_list[]){
	fft_mkl fft(n);
	long bytes = 1l*(2*n)*count*sizeof(double);
	double *space = (double *)_mm_malloc(bytes, 64);
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

	_mm_free(space);
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
	      double* window_begin, double* window_end, int window_len)
{
	double *cyc_list = new double[count];
	cyclelist(n, count, cyc_list);
	
	for(int i=0; i < window_len; i++){
		int wcount = window(cyc_list, count, 
				    window_begin[i], window_end[i]);

		char name[100];
		sprintf(name, "fftxx%d", i);
		PyHist hist(name, PIPE_OFF);
		hist.hist(cyc_list, wcount);
		hist.bins(bins);
	
		char title[200];
		sprintf(title, "n = %d, total trials = %d", n, count);
		hist.title(title);
		
		hist.show();
		hist.savescript();
	}
	delete[] cyc_list;
} 

int main(){
	double window_begin[] = {18000};
	double window_end[] = {50000};
	/*
	 * fft dimension
	 */
	int n = 1024;
	int count = 1000*1000;
	int bins = 1500;
	makehist(n, count, bins, window_begin, window_end, 1);

}
