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

