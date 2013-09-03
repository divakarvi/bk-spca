#include "fft_fftw.hh"
#include <mkl.h>

fft_fftw::fft_fftw(int nin)
  :n(nin)
{
	double *f = MKL_malloc(2*n*sizeof(double), 16);
	pf = fftw_plan_dft_1d(n, f, f, -1, FFTW_MEASURE);
	pb = fftw_plan_dft_1d(n, f, f,  1, FFTW_MEASURE);
	MKL_free(f);
}

fft_fftw::~fft_fftw(){
  fftw_destroy_plan(pf);
  fftw_destroy_plan(pb);
}
