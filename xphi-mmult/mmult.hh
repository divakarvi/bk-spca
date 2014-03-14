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

#ifndef __XPHIMMULT12DEC2013__
#define __XPHIMMULT12DEC2013__

/*
 * a[], b[], c[] are dim x dim matrices
 * c[] = c[] + a[]*b[]
 */

/*
 * single dgemm() call on host or mic
 */
__declspec(target(mic))
void mmult(double *a, double *b, double *c, int dim);
#endif
