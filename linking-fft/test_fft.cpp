#include "../utils/utils.hh"
#include "fft_mkl.hh"
#include "fft_fftw.hh"
#include "nr.hh"
#include <mkl.h>
#include <unistd.h>
#include <cstdlib>
#include <iostream>
enum mkl_align_flag {MKL_ALIGN, MKL_NOALIGN};

void test_mkl(int n, enum mkl_align_flag flag){
	double *ptr = MKL_alloc((4*n+2)*sizeof(double), 16);
	double *v;
	switch(flag){
	case MKL_ALIGN:
		v = ptr;
		break;
	case MKL_NOALIGN:
		v = ptr+1;
		break;
	}
	double *w = v + 2*n;
	
	for(int i=0; i < n; i++){
		v[2*i] = rand()*1.0/RAND_MAX - 0.5;
		v[2*i+1] = rand()*1.0/RAND_MAX - 0.5;
	}

	array_copy(v, w, 2*n);
	verify_dir("DBG/");
	array_out(v, n, 2, "DBG/v.dat");

	fft_mkl fft(n);
	fft.fwd(v);

	array_out(v, n, 2, "DBG/vf.dat");
	//system("test_fft.py DBG/v.dat DBG/vf.dat");

	fft.bwd(v);
	array_diff(v, w, 2*n);
	double rerror = array_max(v, 2*n)/array_max(w, 2*n);
	std::cout<<"\terror in complex 1D fft"<<std::endl;
	std::cout<<"\tn = "<<n<<std::endl;
	std::cout<<"\trel error = "<<rerror<<std::endl;

	MKL_free(ptr);
}

int main(){
	test_mkl(10);
	test_mkl(128);
	test_mkl(1024*12);
}
