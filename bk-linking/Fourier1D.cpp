#include "Fourier1D.hh"
#include <mkl_dfti.h>

Fourier1Dmkl::Fourier1Dmkl(int nin)
  :n(nin)
{
  assert(n > 0);
  DftiCreateDescriptor(&handle,DFTI_DOUBLE,DFTI_COMPLEX,
		       1,n);
  DftiSetValue(handle, DFTI_FORWARD_SCALE, 1.0/n);
  DftiSetValue(handle, DFTI_PLACEMENT, DFTI_NOT_INPLACE);
  DftiCommitDescriptor(handle);
}

Fourier1Dmkl::~Fourier1Dmkl(){
  DftiFreeDescriptor(&handle);
}

void Fourier1Dmkl::fwd(const cVector& in, cVector& out){
  assert(in.getSize()==n);
  assert(out.getSize()==n);
  DftiComputeForward(handle, in.getRawData(), 
		     out.getRawData());
}

void Fourier1Dmkl::bwd(const cVector& in, cVector& out){
  assert(in.getSize()==n);
  assert(out.getSize()==n);
  DftiComputeBackward(handle, in.getRawData(), out.getRawData());
}

Fourier1Dfftw::Fourier1Dfftw(int nin)
  :n(nin)
{
  assert(n > 0);
  cVector in(n);
  cVector out(n);
  pf = fftw_plan_dft_1d(n,in.getRawData(),out.getRawData(),
			-1,FFTW_MEASURE);
  pb = fftw_plan_dft_1d(n,in.getRawData(),out.getRawData(),
			1,FFTW_MEASURE);
}

Fourier1Dfftw::~Fourier1Dfftw(){
  fftw_destroy_plan(pf);
  fftw_destroy_plan(pb);
}

void Fourier1Dfftw::fwd(const cVector& in, cVector& out){
  assert(in.getSize()==n);
  assert(out.getSize()==n);
  fftw_execute_dft(pf, in.getRawData(), out.getRawData());
  out.scale(1.0/n);
}

void Fourier1Dfftw::bwd(const cVector& in, cVector& out){
  assert(in.getSize()==n);
  assert(out.getSize()==n);
  fftw_execute_dft(pb, in.getRawData(), out.getRawData());
}
