#ifndef TESTBLKUTILS8OCT2013
#define TESTBLKUTILS8OCT2013

/*
 * c[]: mxn, column major order.
 * m, n divisible by 2.
 * Each 2x2 subblock is skewed.
 */
void skew2x2(double *c, int m, int n);

/*
 * bb[]: 200x4 matrix in column major order with ldbb.
 * b[]: bb[] packed in row major format.
 */
void transpose200x4(double *bb, int ldbb, double *b);

/*
 * Easy matrix mult for testing.
 */
void easymult(double *restrict a, double *restrict b, double *restrict c,
	      int m, int n, int p);
#endif

