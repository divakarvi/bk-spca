#ifndef TRANSPOSE7OCT2013
#define TRANSPOSE7OCT2013

const int B = 125;

/*
 * Transposes a[] to b[] in obvious way.
 */
void easytrans(double *restrict a, double *restrict b, int m, int n);

/*
 * Transposes a[] to b[] in B x B sized blocks. 
 * oneblock() is a separate function, not inlined.
 */
void blocktrans(double *restrict a, double *restrict b, int m, int n);

/*
 * Transposes a[] to b[] in B x B sized blocks.
 * Blocking is achieved using a quadruple loop nest.
 */
void blocktransx(double *restrict a, double *restrict b, int m, int n);

/*
 * Transposes using recursive blocking, B x B blocks are the fundamental units.
 */
void recursivetrans(double *restrict a, double *restrict b, 
			   int m, int n);

/*
 * Transposes with recursive blocking assuming n/B power of 2.
 * Recursion is completely unrolled into loops.
 */
void pow2trans(double *restrict a, double *restrict b, int n);

#endif

