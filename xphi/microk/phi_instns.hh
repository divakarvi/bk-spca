/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#ifndef __PHIINSTNS13DEC2013__
#define __PHIINSTNS13DEC2013__
/*
 * c = c + a*b
 * single fma instn
 * a,b,c must be 64 byte aligned
 *
 * defined in fma0.s, ..., fma7.s corrs to different swizzles
 */
void fma(double *a, double *b, double *c);

#endif
