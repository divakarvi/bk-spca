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


void multijk(double *a, double *b, double *c, int dim){
  for(int i=0; i < dim; i++)
    for(int j=0; j < dim; j++)
      for(int k=0; k < dim; k++)
	c[i+j*dim] += a[i+k*dim]*b[k+j*dim];
}

void multijkx(double *a, double *b, double *c, int dim){
  for(int i=0; i < dim; i++)
    for(int j=0; j < dim; j++){
      double x = c[i+j*dim];
      for(int k=0; k < dim; k++)
	x += a[i+k*dim]*b[k+j*dim];
      c[i+j*dim] = x;
    }
}


void multIJK(double *restrict a, double *restrict b, double *restrict c, 
	     int dim){
  for(int i=0; i < dim; i++)
    for(int j=0; j < dim; j++)
      for(int k=0; k < dim; k++)
	c[i+j*dim] += a[i+k*dim]*b[k+j*dim];
}

void multIJKX(double *restrict a, double *restrict b, double *restrict c, 
	      int dim){
  for(int i=0; i < dim; i++)
    for(int j=0; j < dim; j++){
      double x = c[i+j*dim];
      for(int k=0; k < dim; k++)
	x += a[i+k*dim]*b[k+j*dim];
      c[i+j*dim] = x;
    }
}





