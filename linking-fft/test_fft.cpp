/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include "../utils/utils.hh"
#include "fft_mkl.hh"
#include "fft_fftw.hh"
#include "nr.hh"
#include <unistd.h>
#include <iostream>
#include <cstdlib>

enum mkl_align_flag {MKL_ALIGN, MKL_NOALIGN};

/*
 * does a single fwd+bwd fft of size n and checks it agains python
 * to test fftw replace fft_mkl fft_fftw and verify flag == MKL_ALIGN
 */
void test_mkl(int n, enum mkl_align_flag flag){
	double *space = (double *)_mm_malloc((4*n+2)*sizeof(double), 16);
	double *v;
	switch(flag){
	case MKL_ALIGN:
		v = space;
		break;
	case MKL_NOALIGN:
		v = space+1;
		break;
	}
	double *w = v + 2*n;
	
	for(int i=0; i < n; i++){
		w[2*i] = v[2*i] = rand()*1.0/RAND_MAX - 0.5;
		w[2*i+1] = v[2*i+1] = rand()*1.0/RAND_MAX - 0.5;
	}

	verify_dir("DBG/");
	array_out(v, 2, n, "DBG/v.dat");
	fft_mkl fft(n);
	fft.fwd(v);
	array_out(v, 2, n, "DBG/vf.dat");
	system("test_fft.py DBG/v.dat DBG/vf.dat");

	fft.bwd(v);
	array_diff(v, w, 2*n);
	double rerror = array_max(v, 2*n)/array_max(w, 2*n);
	std::cout<<"\n\tfwd+bwd error in complex mkl 1D fft"<<std::endl;
	std::cout<<"\tn = "<<n<<std::endl;
	std::cout<<"\trel error = "<<rerror<<std::endl;

	_mm_free(space);
}

void test_nr(int n){
	double *space = new double[4*n];
	
	double *v = space;
	double *w = space + 2*n;
	for(int i=0; i < n; i++){
		w[2*i] = v[2*i] = rand()*1.0/RAND_MAX - 0.5;
		w[2*i+1] = v[2*i+1] = rand()*1.0/RAND_MAX - 0.5;
	}

	fft_mkl fft(n);
	nrbwd(v, n);
	fft.bwd(w);
	
	array_diff(v, w, 2*n);
	std::cout<<"\n\tNR error relative to MKL"<<std::endl;
	std::cout<<"\tn = "<<n<<std::endl;
	std::cout<<"\trel error = "<<array_max(v, 2*n)/array_max(w,2*n)
		 <<std::endl;

	delete[] space;
}


int main(){
	test_mkl(10, MKL_NOALIGN);
	test_mkl(128, MKL_ALIGN);
	test_mkl(1024*12, MKL_NOALIGN);
	test_mkl(8, MKL_ALIGN);

	test_nr(8);
	test_nr(256);
	test_nr(1024*16);
}
