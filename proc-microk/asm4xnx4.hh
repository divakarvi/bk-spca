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

#ifndef __asm4xnx4_1Oct2013__
#define __asm4xnx4_1Oct2013__

/*
 * a = column major format
 * b = row major format
 * c = skewed format (see test_asm.cpp)
 */
extern "C"{
	void asm4x1x4(double *a, double *b, double *c);
	void asm4x4x4(double *a, double *b, double *c);
	void asm4x20x4(double *a, double *b, double *c);
	void asm4x40x4(double *a, double *b, double *c);
	void asm4x100x4(double *a, double *b, double *c);
	void asm4x200x4(double *a, double *b, double *c);
}
#endif


