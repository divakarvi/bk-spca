#ifndef XPHIMMULT12DEC2013
#define XPHIMMULT12DEC2013

/*
 * a[], b[], c[] are dim x dim matrices.
 * c[] = c[] + a[]*b[].
 */

/*
 * single dgemm() call on host or mic.
 */
__declspec(target(mic))
void mmult(double *a, double *b, double *c, int dim);
#endif

