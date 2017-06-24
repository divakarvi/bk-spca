#ifndef mmult26Sept2014
#define mmult26Sept2014

enum mmult_enum {GMEM_MULT, SMEM_MULT};
/*
 * N must be divisible by SQRTT (defed in ../utils/const.hh).
 * SQRTT*SQRTT must equal THinBLK (defed in ../utils/const.hh).
 * C = C + A*B, where A, B, C are NxN matrices in column major order.
 * Returns time in millisecs.
 */
double mmult(double *A, double *B, double *C, int N, 
	   enum mmult_enum flag = SMEM_MULT);
#endif

