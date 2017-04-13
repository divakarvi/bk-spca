#ifndef __DVRANDOM__
#define __DVRANDOM__
#include <mkl_vsl.h>
#include <mkl.h>

class Random{
 private:
  VSLStreamStatePtr stream;
  Random(const Random& );
 public:
  Random(unsigned int seed = 0){
    int status = vslNewStream(&stream, VSL_BRNG_MCG59, seed);
  }
  /* returns normally distributed random variable of variance sigma */
  double randn(double sigma = 1.0){
    double val;
    int status = vdRngGaussian(VSL_RNG_METHOD_GAUSSIAN_ICDF,
			       stream, 1, &val, 0, sigma);//mean=0
    return val;
  }
  /* returns variable uniformly distributed in [a,b] */
  double rand(double a = 0.0, double b = 1.0){
    double val;
    int status = vdRngUniform(VSL_RNG_METHOD_UNIFORM_STD,
			      stream, 1, &val, a, b);
    return val;
  }
  ~Random(){
    int status = vslDeleteStream(&stream);
  }
};
#endif


