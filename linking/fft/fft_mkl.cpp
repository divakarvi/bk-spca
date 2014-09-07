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

#include "fft_mkl.hh"
#include <mkl_dfti.h>

fft_mkl::fft_mkl(int nin)
  :n(nin)
{
	DftiCreateDescriptor(&handle,DFTI_DOUBLE,DFTI_COMPLEX,
			     1,n);
	DftiSetValue(handle, DFTI_FORWARD_SCALE, 1.0/n);
	DftiSetValue(handle, DFTI_PLACEMENT, DFTI_INPLACE);
	DftiCommitDescriptor(handle);
}

fft_mkl::~fft_mkl(){
	DftiFreeDescriptor(&handle);
}
