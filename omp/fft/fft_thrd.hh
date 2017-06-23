#ifndef FFTTHRD23OCT2013
#define FFTTHRD23OCT2013
#include "../../linking/fft/fft_mkl.hh"

class fft_thrd{
private:
	int n;
	long count;
	int nthreads;
	fft_mkl **fftlist;
public:
	/*
	 *     ni: dim of each complex to complex 1D FFT.
	 * counti: number of 1D FFTs.
	 *    nth: number of omp threads.
	 */
	fft_thrd(int ni, long counti, int nth);
	~fft_thrd();
	/*
	 * v[]: array of length 2*n*count.
	 * fwd and bwd transforms are both in place.
	 */
	void fwd(double *v);
	void bwd(double *v);
	/*
	 * numa (non-uniform mem access) initializes v to 0.
	 */
	void numa_init(double *v);
};

#endif

