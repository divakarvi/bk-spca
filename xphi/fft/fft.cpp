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

#include "fft.hh"
#include <mkl_dfti.h>

__declspec(target(mic))
FFT::FFT(int n, long count){
	DftiCreateDescriptor(&handle, DFTI_DOUBLE, DFTI_COMPLEX,
			     1,n);
	DftiSetValue(handle, DFTI_NUMBER_OF_TRANSFORMS, count);
	DftiSetValue(handle, DFTI_INPUT_DISTANCE, n);
	DftiSetValue(handle, DFTI_OUTPUT_DISTANCE, n);
	DftiSetValue(handle, DFTI_FORWARD_SCALE, 1.0/n);
	DftiSetValue(handle, DFTI_PLACEMENT, DFTI_INPLACE);
	DftiCommitDescriptor(handle);
}


__declspec(target(mic))
FFT::~FFT(){
	DftiFreeDescriptor(&handle);
}
