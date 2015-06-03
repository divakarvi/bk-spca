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

#ifndef __fftw2Sept2013__
#define __fftw2Sept2013__
#include "../../utils/utils.hh"
#include <fftw3.h>

class fft_fftw{
private:
	int n;
	fftw_plan pf;
	fftw_plan pb;
public:
	fft_fftw(int nin); //length of Fourier transform
	~fft_fftw();
	/*
	 * f = 2*n doubles (n complex numbers)
	 * fwd: f phys ---> fourier in-place
	 * bwd: f fourier---> phys in-place
	 */
	void fwd(double *f){
		assrt((long)f%32 == 0);
		fftw_execute_dft(pf, (fftw_complex *)f, (fftw_complex *)f);
		for(int i=0; i < 2*n; i++)
			f[i] /= n;
	}
	void bwd(double *f){
		assrt((long)f%32 == 0);
		fftw_execute_dft(pb, (fftw_complex *)f, (fftw_complex *)f);
	}
};

#endif
