#ifndef __mmult26Sept2014__
#define __mmult26Sept2014__

enum mmult_enum {GMEM_MULT, SMEM_MULT};
/*
 * N must be divisible by SQRTT (defed in ../utils/const.hh)
 * SQRTT*SQRTT must equal THinBLK (defed in ../utils/const.hh)
 * C = C + A*B, where A, B, C are NxN matrices in column major order
 * returns time in millisecs
 */
double mmult(double *A, double *B, double *C, int N, 
	   enum mmult_enum flag = SMEM_MULT);
#endif

