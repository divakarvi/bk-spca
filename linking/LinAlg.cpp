#include <mkl.h>
#include <cmath>
#include <iostream>
#include "Vector.hh"
#include "Matrix.hh"
/*
extern "C" void dgetrf_(int *, int *, 
		       double *, int *, 
		       int *,
		       int *);

extern "C" void dgetrs_(char *, int *, int *, 
		       double *, int *,
		       int *,
		       double *, int *,
		       int *);
*/

void lufactorize(Matrix& M, int *ipiv){
  int m = M.getm();
  int n = M.getn();
  double *A = M.getRawData();
  int lda = M.getLDA();
  int info;
  dgetrf_(&m, &n, A, &lda, ipiv, &info); //LAPACK call
}

void lusolve(Matrix& M, int * ipiv, Vector & v){
  char trans[3] = "N ";
  int n = M.getm();
  assert(M.getm()==M.getn());
  int nrhs = 1;
  double *A = M.getRawData();
  int lda = M.getLDA();
  double *B = v.getRawData();
  assert(v.getSize()==n);
  int ldb  = n;
  int info;
  dgetrs_(trans, &n, &nrhs, A, &lda, ipiv, B, &ldb, 
	  &info);//LAPACK call
}
