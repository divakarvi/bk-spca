#include "../../utils/utils.hh"
#include "fft.hh"
#include <cmath>

void test1(int n, long count){
	double *v = new double[2*n*count];
	for(int j=0; j < count; j++)
		for(int i=0; i < n; i++){
			double x = 2.0*PI*i/n;
			v[2*i+2*j*n] = 2*j*cos(x);
			v[2*i+1+2*j*n] = 2*j*sin(x);
		}

	FFT fft(n, count);
	fft.fwd(v);
	
	for(int j=0; j < count; j++){
		array_show(v+2*j*n, 5, "3 fourier coeffs");
		if(j > 10)
			break;
	}

	delete[] v;
}

int main(){
	test1(12, 10000);
}

