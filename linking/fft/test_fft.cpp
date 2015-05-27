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

#include "../../utils/utils.hh"
#include "fft_fftw.hh"
#include "nr.hh"
#include <mm_malloc.h>
#include <unistd.h>
#include <iostream>
#include <cstdlib>


/*
 * does a single fwd+bwd fft of size n and checks it agains python
 */
void test_fftw(int n){
	double *space = (double *)_mm_malloc((4*n+2)*sizeof(double), 64);
	double *v;
	v = space;
	double *w = v + 2*n;
	
	for(int i=0; i < n; i++){
		w[2*i] = v[2*i] = rand()*1.0/RAND_MAX - 0.5;
		w[2*i+1] = v[2*i+1] = rand()*1.0/RAND_MAX - 0.5;
	}

	verify_dir("DBG/");
	array_out(v, 2, n, "DBG/v.dat");
	fft_fftw fft(n);
	fft.fwd(v);
	array_out(v, 2, n, "DBG/vf.dat");
	system("test_fft.py DBG/v.dat DBG/vf.dat");

	fft.bwd(v);
	array_diff(v, w, 2*n);
	double rerror = array_max(v, 2*n)/array_max(w, 2*n);
	std::cout<<"\n\tfwd+bwd error in complex fftw 1D fft"<<std::endl;
	std::cout<<"\tn = "<<n<<std::endl;
	std::cout<<"\trel error = "<<rerror<<std::endl;

	_mm_free(space);
}

void test_nr(int n){
	double *space = (double *)_mm_malloc(4*n*sizeof(double), 64);
	
	double *v = space;
	double *w = space + 2*n;
	for(int i=0; i < n; i++){
		w[2*i] = v[2*i] = rand()*1.0/RAND_MAX - 0.5;
		w[2*i+1] = v[2*i+1] = rand()*1.0/RAND_MAX - 0.5;
	}

	fft_fftw fft(n);
	nrbwd(v, n);
	fft.bwd(w);
	
	array_diff(v, w, 2*n);
	std::cout<<"\n\tNR error relative to FFTW"<<std::endl;
	std::cout<<"\tn = "<<n<<std::endl;
	std::cout<<"\trel error = "<<array_max(v, 2*n)/array_max(w,2*n)
		 <<std::endl;

	_mm_free(space);
}


int main(){
	test_fftw(10);
	test_fftw(128);
	test_fftw(1024*12);
	test_fftw(8);

	test_nr(8);
	test_nr(256);
	test_nr(1024*16);
}
