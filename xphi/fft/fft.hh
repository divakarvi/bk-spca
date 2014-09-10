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

#ifndef __MICFFT9DEC2013__
#define __MICFFT9DEC2013__
#include <mkl_dfti.h>

__declspec(target(mic))
class FFT{
private:
	DFTI_DESCRIPTOR_HANDLE handle;
public:
	/*
	 * n = size of 1D complex to complex transform 
	 * count = number of transforms
	 */
	FFT(int n, long count);
	~FFT();
	/*
	 * f = 2*n*count double (n*count complex numbers) 
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
