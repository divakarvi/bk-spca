/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include "lusolve.hh"
#include <cblas.h>
#include <cmath>
#include <iostream>


extern "C" void dgetrf_(int *, int *, 
		       double *, int *, 
		       int *,
		       int *);

extern "C" void dgetrs_(char *, int *, int *, 
		       double *, int *,
		       int *,
		       double *, int *,
		       int *);

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
