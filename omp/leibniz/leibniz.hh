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

#ifndef __ompliebniz16Oct2013__
#define __ompliebniz16Oct2013__
/*
 * single thread
 * returns partial sum of n terms of 4 * (1-1/3 + 1/5 - ...)
 */ 
double leibniz(long int n);

/*
 * uses parallel regions
 * nthreads must be even 
 * (because Leibniz has alt positive and neg terms)
 * (single thread gets terms of the same sign)
 */
double parallel(long int n, int nthreads);

/*
 * similar function to above, but implemented in a different style
 */
double parallelX(long int n, int nthreads);

/*
 * omp for construct for leibniz partial sum
 */
double ompfor(long int n,  int nthreads);

/*
 * omp for 
 * static scheduling in chunks
 */
double ompforchunk(long int n,  int nthreads, int chunk);

/*
 * combine parallel and for into single construct
 */
double parallelfor(long int n, int nthreads);

/*
 * section construct (one among many exotic constructs)
 */
double section(long int n);
#endif
