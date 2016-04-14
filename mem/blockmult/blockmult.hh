#ifndef __BLOCKMULT7OCT2013__
#define __BLOCKMULT7OCT2013__

/*
 * a = 4x200 in column major format
 * b = 200x12, three successive 200 x 4 blocks each in row major format
 * c = 4x12 in skew form
 */
void mult4x200x12(double *a, double *b, double *c);

/*
 * a = 600x200, 150 succ 4x200 blocks each in column major format
 * b = 200x12, 3 succ 200x4 blocks each in row major format
 * C = column major with ldC and skewed
 */
void mult600x200x12(double *a, double *b, 
		    double *C, int ldC,
		    double *scratch);

/*
 * A = 600x200, column major with ldA
 * b = 200x3000, 750 succ 200x4 blocks, each in row major format
 * C = 600x3000, column major with ldC, skewed
 */
void mult600x200x3000(double *A, int ldA,
		      double *b,
		      double *C, int ldC,
		      double *scratch);

/*
 * A, B, C in column major formats with ldA/ldB/ldC
 * C is skewed
 */
void mult3000x200x3000(double *A, int ldA,
		       double *B, int ldB,
		       double *C, int ldC,
		       double *scratch);

/*
 * A = lxm matrix
 * B = mxn matrix
 * C = lxn matrix
 * each matrix is in column major format with leading dim = num of rows
 * l%3000 == m%200 == n%3000 == 0
 */
void blockmult(double *A, double *B, double *C,
	       int l, int m, int n,
	       double *scratch);
#endif
