#ifndef __fft_mkl02Sept2013__
#define __fft_mkl02Sept2013__
#include <mkl_dfti.h>

class fft_mkl{
private:
	int n;
	DFTI_DESCRIPTOR_HANDLE handle;
public:
	fft_mkl(int nin); //nin: length of Fourier transform
	~fft_mkl();
	/*
	 *   f: 2*n double (n complex numbers) 
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

