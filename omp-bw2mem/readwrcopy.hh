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

#ifndef __READWRCOPY21OCT2013__
#define __READWRCOPY21OCT2013__
/*
 * numa init of list using nthreads and random numbers
 */
void init_manycore(double *list, long len, int nthreads);
/*
 * init to zero
 */
void init_manycore_cheap(double *list, long len, int nthreads);

/*
 * returns list[0] + .... + list[len-1]
 */
double sum_manycore(double *list, long len, int nthreads);


/*
 * list[first+i] = i by each thread
 * first = tid*len/nthreads
 */
void write_manycore(double *list, long len, int nthreads);

/*
 * list[first + i] = list[first + i + n/2] 
 * first = tid*len/nthreads
 * n = next - first
 */
double copy_manycore(double *list, long len, int nthreads);
#endif
