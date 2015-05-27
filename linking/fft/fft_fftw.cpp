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

#include "fft_fftw.hh"
#include <mm_malloc.h>

fft_fftw::fft_fftw(int nin)
  :n(nin)
{
	double *f = (double *)_mm_malloc(2*n*sizeof(double), 16);
	fftw_complex *ff  = (fftw_complex *)f;
	pf = fftw_plan_dft_1d(n, ff, ff, -1, FFTW_MEASURE);
	pb = fftw_plan_dft_1d(n, ff, ff,  1, FFTW_MEASURE);
	_mm_free(f);
}

fft_fftw::~fft_fftw(){
	fftw_destroy_plan(pf);
	fftw_destroy_plan(pb);
}
