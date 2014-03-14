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

#include "easyxmm.hh"
#include <cstdio>

/*
 * the assembly of runmacro() must be inspected to ensure code is correct.
 * it is legal for the compiler to reuse xmm0 and xmm1 to store temp
 * data in-between the four macro calls here
 */
void xmmtest(){
	__declspec(align(16)) double a[2]={1,2};
	__declspec(align(16)) double b[2]={-1,-2};
	loadxmm(a, "%xmm0");
	loadxmm(b, "%xmm1");
	addxmm("%xmm1", "%xmm0");
	storexmm("%xmm0", a);
	printf("%f %f \n", a[0], a[1]);
}

int main(){
	xmmtest();
}
