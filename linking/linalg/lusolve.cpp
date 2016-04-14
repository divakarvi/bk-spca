#include "lusolve.hh"
#include <mkl.h>
#include <cmath>
#include <iostream>

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

LU_Solve::LU_Solve(double *a, int dimi)
	:dim(dimi)
{
	A = new double[dim*dim];
	ipiv = new int[dim];
	for(int i=0; i < dim*dim; i++)
		A[i] = a[i];
}

LU_Solve::~LU_Solve(){
	delete[] A;
	delete[] ipiv;
}

void LU_Solve::factorize(){
	int m = dim;
	int n = dim;
	int lda = dim;
	int info;
	dgetrf_(&m, &n, A, &lda, ipiv, &info); //LAPACK call
}

void LU_Solve::solve(double *v){
	char trans[3] = "N ";
	int nrhs = 1;
	int lda = dim;
	int ldv  = dim;
	int info;
	dgetrs_(trans, &dim, &nrhs, A, &lda, ipiv, v, &ldv, 
		&info);//LAPACK call
}
