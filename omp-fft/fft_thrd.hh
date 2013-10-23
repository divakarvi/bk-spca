#ifndef __FFTTHRD23OCT2013__
#define __FFTTHRD23OCT2013__
#include "../linking-fft/fft-mkl.hh"

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
};

#endif
