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

#ifndef __OMPTRANS22OCT2013__
#define __OMPTRANS22OCT2013__

/*
 * Block size (change B to gl_B later)
 */
extern int B;
void easytrans(double *restrict a, double *restrict b, int ldb,
	       int m, int n);
/*
 * single threaded transpose using B x B blocks
 * ldb = leading dim of B
 */
void blocktransx(double *restrict a, double *restrict b, 
		 int ldb, int m, int n);

/*
 * multithreaded transpose of a[] to b[]
 */
void blocktrans(double *restrict a, double *restrict b,
		int m, int n, int nthreads);
#endif
