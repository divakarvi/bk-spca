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

