#ifndef __cumult26sept2014__
#define __cumult26sept2014__
#include "../utils/dhstmem.hh"
#include <cublas_v2.h>

class CuMult{
private:
	int N;
	dhstmem<double> memA, memB, memC;
	cublasHandle_t h;
public:
	CuMult(int Ni);
	~CuMult();
	/*
	 * C = C + A*B, A[], B[], C[] are NxN matrices
	 * returns time in millisecs
	 */
	double mult(double *A, double *B, double *C);
};

#endif

