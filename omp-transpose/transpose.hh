#ifndef __OMPTRANS22OCT2013__
#define __OMPTRANS22OCT2013__

/*
 * Block size must be set manually here if const int
 * not if extern int
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
