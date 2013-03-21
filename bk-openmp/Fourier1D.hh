#ifndef __MyFourier1D__
#define __MyFourier1D__
#include <mkl_dfti.h>
#include <fftw3.h>
#include "cVector.hh"

class Fourier1Dmkl{
private:
  int n;
  DFTI_DESCRIPTOR_HANDLE handle;
public:
  Fourier1Dmkl(int nin); //length of Fourier transform
  ~Fourier1Dmkl();
  void fwd(const cVector& in, cVector& out);
  void bwd(const cVector& in, cVector& out);
  void fwd(double *in, double *out){
    DftiComputeForward(handle, in, out);
  }
  void bwd(double *in, double *out){
    DftiComputeBackward(handle, in, out);
  }
};

class Fourier1Dfftw{
private:
  int n;
  fftw_plan pf;
  fftw_plan pb;
public:
  Fourier1Dfftw(int nin); //length of Fourier transform
  ~Fourier1Dfftw();
  void fwd(const cVector& in, cVector& out);
  void bwd(const cVector& in, cVector& out);
  //in/out pointers must be 16 byte aligned
  void bwd(double *in, double *out){
    fftw_execute_dft(pb, (fftw_complex *)in, (fftw_complex *)out);
  }
};

#endif
