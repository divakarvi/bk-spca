#include "../utils/utils.hh"
#include "fft_thrd.hh"
#include <iostream>
#include <cmath>
#include <mkl.h>

void test(int n, long count, int nth){
	long len = 2l*n*count;
	long nbytes = len * sizeof(double);
	double *v = (double *)MKL_malloc(nbytes, 64);
	
	for(long j=0; j < count; j++)
		for(int i=0; i < n; i++){
			double x = 2.0*PI*i/n;
			v[2*i + 2*n*j] = 2*j*cos(x);
			v[2*i + 1 + 2*n*j] = 0;
		}
	
	fft_thrd fft(n, count, nth);
	fft.fwd(v);
	
	for(long j=0; j < count; j++){
		std::cout<<v[2*n*j]<<std::endl;
		std::cout<<v[2*n*j + 1]<<std::endl;
		std::cout<<v[2*n*j + 2]<<std::endl;
		std::cout<<v[2*n*j + 3]<<std::endl;
		std::cout<<"\n\n";
	}
	
	MKL_free(v);
}

int main(){
	test(10, 24, 4);
}
