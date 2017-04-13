#include "mmult.hh"
#include <offload.h>
#include <mkl.h>

__declspec(target(mic))
void mmult(double *a, double *b, double *c, int dim){
	char transa[3] = "N";
	char transb[3] = "N";
	
	double alpha = 1;
       	dgemm(transa, transb, &dim, &dim, &dim, &alpha,
	      a, &dim, b, &dim,
	      &alpha,
	      c, &dim);
}


