#ifndef __XPHIMMULT12DEC2013__
#define __XPHIMMULT12DEC2013__

/*
 * a[], b[], c[] are dim x dim matrices
 * c[] = c[] + a[]*b[]
 */

/*
 * single dgemm() call on host or mic
 */
__declspec(target(mic))
void mmult(double *a, double *b, double *c, int dim);


/*
 * dgemm() call offloaded using mkl's automatic offload
 */
void mmult_auto(double *a, double *b, double *c, int dim);
#endif
