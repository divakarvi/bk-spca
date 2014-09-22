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

#ifndef __TRANSPOSE7OCT2013__
#define __TRANSPOSE7OCT2013__

const int B = 125;

/*
 * obvious way to transpose a to b 
 */
void easytrans(double *restrict a, double *restrict b, int m, int n);

/*
 * transpose a to b in B x B sized blocks. 
 * block transpose is a separate function, not inlined.
 */
void blocktrans(double *restrict a, double *restrict b, int m, int n);

/*
 * transpose a to be in B x B sized blocks
 * blocking is achieved using a quadruple loop nest.
 */
void blocktransx(double *restrict a, double *restrict b, int m, int n);

/*
 * recursive blocking, B x B blocks are the fundamental units 
 */
void recursivetrans(double *restrict a, double *restrict b, 
			   int m, int n);

/*
 * recursive blocking assuming n power of 2 
 * B x B blocks with n divisible by B and n/B power of 2
 * recursion is completely unrolled into loops
 */
void pow2trans(double *restrict a, double *restrict b, int n);

#endif
