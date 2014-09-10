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

#include "../../utils/utils.hh"
#include "asm_mult.hh"
#include <algorithm>
#include <iostream>
#include <cstdlib>

void test8x1x8_a(){
	__declspec(align(64)) double a[8] = {0, 1, 2, 3, 4, 5, 6, 7};
	__declspec(align(64)) double b[8] = {0, 1, 2, 3, 4, 5, 6, 7};
	__declspec(align(64)) double c[64] = {0};

	asm8x1x8(a, b, c);

	array_out(c, 8, 8);
}

void mult(double *a, double *b, double *c){
	for(int i=0; i < 8; i++)
		for(int j=0; j < 8; j++)
			c[i+j*8] += a[i]*b[j];
}

/*
 * a[] = 8xn matrix in column major order
 * b[] = nx8 matrix in row major order
 * c[] = product of a[] and b[]
 */
void mult(int n, double *a, double *b, double *c){
	for(int i=0; i < 64; i++)
		c[i] = 0.0;

	for(int i=0; i < n; i++)
		mult(a+i*8, b+i*8, c);
	
}

/*
 * test asm8xnx8
 */
void testn(int n){
	std::cout<<"testn: n = "<<n<<std::endl;
	__declspec(align(64)) double a[8*n];
	__declspec(align(64)) double b[8*n];
	__declspec(align(64)) double c[64];

	for(int i=0; i < 8*n; i++){
		a[i] = rand()*1.0/RAND_MAX;
		b[i] = rand()*1.0/RAND_MAX;
	}

	for(int i=0; i < 64; i++)
		c[i] = 0.0;


	switch(n){
	case 1:
		asm8x1x8(a, b, c);
		break;
	case 12:
		asm8x12x8(a, b, c);
		break;
	case 24:
		asm8x24x8(a, b, c);
		break;
	case 36:
		asm8x36x8(a, b, c);
		break;
	case 48:
		asm8x48x8(a, b, c);
		break;	
	default:
		assrt(0==1);
	}
	std::sort(c, c+64);

	double cc[64];
	mult(n, a, b, cc);
	std::sort(cc, cc+64);

	array_diff(c, cc, 64);
	std::cout<<"error = "<<array_max(c, 64)/array_max(cc, 64)<<std::endl;
}

int main(){
	testn(1);
	testn(12);
	testn(24);
	testn(36);
	testn(48);
}
