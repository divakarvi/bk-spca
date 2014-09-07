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

#ifndef __fft_mkl02Sept2013__
#define __fft_mkl02Sept2013__
#include <mkl_dfti.h>

class fft_mkl{
private:
	int n;
	DFTI_DESCRIPTOR_HANDLE handle;
public:
	fft_mkl(int nin); //length of Fourier transform
	~fft_mkl();
	/*
	 * f = 2*n double (n complex numbers) 
	 * fwd: f phys ---> fourier in-place
	 * bwd: f fourier---> phys in-place
	 */
	void fwd(double *f){
		DftiComputeForward(handle, f);
	}
	void bwd(double *f){
		DftiComputeBackward(handle, f);
	}
};

#endif
