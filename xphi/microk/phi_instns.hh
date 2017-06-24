#ifndef PHIINSTNS13DEC2013
#define PHIINSTNS13DEC2013
/*
 * c = c + a*b
 * Single fma (fused-mult-add) instn.
 * a[], b[], c[] must be 64 byte aligned
 *
 * Definitions in fma0.s, ..., fma7.s corresponding to different swizzles.
 */
void fma(double *a, double *b, double *c);

#endif

