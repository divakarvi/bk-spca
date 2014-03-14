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

#ifndef __SUMCOPY7OCT2013__
#define __SUMCOPY7OCT2013__

/*
 * return a[0] + ... + a[n-1]
 */
double sum(double *restrict a, long int n);

/*
 * return a[0] + a[stride] + a[2*stride] + ...
 */
double sumstride(double *restrict a, long int n, int stride);

/*
 * return a[0] + a[STR] + a[2*STR]... where STR is const
 */
double sumconststride(double *restrict a, long int n);

/*
 * b[i] = a[i] for i = 0..n
 */
void copy(double *restrict a, double *restrict b, long int n);

/*
 * b[i] = a[i] for i = 0, STR, 2*STR, ... where STR is const
 */
void copyconststride(double *restrict a, double *restrict b, long int n);

const int STR=1;

#endif
