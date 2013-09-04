#include "../pyplot/pyhist.hh"
#include "fft_mkl.hh"
#include <mkl.h>

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

void makehist(int n, int count, int bins){
	double *cyc_list = new double[count];
	
	cyclelist(n, count, cyc_list);
	
	PyHist hist("ffwd");
	hist.hist(cyc_list, count);
	hist.bins(bins);
	hist.show();

	delete[] cyc_list;
} 

int main(){
	makehist(1024, 1000*1000, bins);
}
