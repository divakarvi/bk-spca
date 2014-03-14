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

#ifndef __FFTTHRD23OCT2013__
#define __FFTTHRD23OCT2013__
#include "../linking-fft/fft_mkl.hh"

class fft_thrd{
private:
	int n;
	long count;
	int nthreads;
	fft_mkl **fftlist;
public:
	/*
	 * ni     = dim of each complex to complex 1D FFT
	 * counti = number of 1D FFTs
	 * nth    = number of omp threads
	 */
	fft_thrd(int ni, long counti, int nth);
	~fft_thrd();
	/*
	 * v = array on len 2*n*count
	 * fwd and bwd transforms are both in place
	 */
	void fwd(double *v);
	void bwd(double *v);
	/*
	 * numa initialize v to 0
	 */
	void numa_init(double *v);
};

#endif
