#ifndef TRANSPOSE7OCT2013
#define TRANSPOSE7OCT2013

const int B = 125;

/*
 * Obvious way to transpose a to b.
 */
void easytrans(double *restrict a, double *restrict b, int m, int n);

/*
 * Transpose a to b in B x B sized blocks. 
 * Block transpose is a separate function, not inlined.
 */
void blocktrans(double *restrict a, double *restrict b, int m, int n);

/*
 * Transpose a to be in B x B sized blocks.
 * Blocking is achieved using a quadruple loop nest.
 */
void blocktransx(double *restrict a, double *restrict b, int m, int n);

/*
 * Recursive blocking, B x B blocks are the fundamental units.
 */
void recursivetrans(double *restrict a, double *restrict b, 
			   int m, int n);

/*
 * Recursive blocking assuming n power of 2.
 * B x B blocks with n divisible by B and n/B power of 2
 * Recursion is completely unrolled into loops.
 */
void pow2trans(double *restrict a, double *restrict b, int n);

#endif

