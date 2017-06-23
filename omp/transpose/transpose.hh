#ifndef OMPTRANS22OCT2013
#define OMPTRANS22OCT2013

/*
 * Block size.
 */
extern int B;
void easytrans(double *restrict a, double *restrict b, int ldb,
	       int m, int n);
/*
 * Transposes a[] to b[] using single thread and B x B blocks.
 * ldb: leading dim of B.
 */
void blocktransx(double *restrict a, double *restrict b, 
		 int ldb, int m, int n);

/*
 * Transposes a[] to b[] using multiple threads.
 */
void blocktrans(double *restrict a, double *restrict b,
		int m, int n, int nthreads);
#endif

