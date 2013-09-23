#include "fft_fftw.hh"
#include <mkl.h>

fft_fftw::fft_fftw(int nin)
  :n(nin)
{
	double *f = (double *)MKL_malloc(2*n*sizeof(double), 16);
	fftw_complex *ff  = (fftw_complex *)f;
	pf = fftw_plan_dft_1d(n, ff, ff, -1, FFTW_MEASURE);
	pb = fftw_plan_dft_1d(n, ff, ff,  1, FFTW_MEASURE);
	MKL_free(f);
}

fft_fftw::~fft_fftw(){
	fftw_destroy_plan(pf);
	fftw_destroy_plan(pb);
}
