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
