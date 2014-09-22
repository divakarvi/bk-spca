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

#ifndef __TESTBLKUTILS8OCT2013__
#define __TESTBLKUTILS8OCT2013__

/*
 * c = mxn, column major order
 * m, n divisible by 2
 * each 2x2 subblock is skewed
 */
void skew2x2(double *c, int m, int n);

/*
 * bb is a 200x4 matrix in column major order with ldbb
 * bb is packed in row major format into b
 */
void transpose200x4(double *bb, int ldbb, double *b);

/*
 * easy matrix mult for testing
 */
void easymult(double *restrict a, double *restrict b, double *restrict c,
	      int m, int n, int p);
#endif
