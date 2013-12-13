#ifndef __PHIINSTNS13DEC2013__
#define __PHIINSTNS13DEC2013__
/*
 * c = c + a*b
 * single fma instn
 * a,b,c must be 64 byte aligned
 */
void fma(double *a, double *b, double *c);

#endif
