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

