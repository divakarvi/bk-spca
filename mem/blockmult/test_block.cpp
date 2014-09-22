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
#include "test_utils.hh"
#include "blockmult.hh"
#include <cstdlib>
#include <cstdio>

/*
 * returns relative error
 */
double test4x200x12(){
	__declspec(align(16)) double a[800];
	__declspec(align(16)) double b[200*12];
	__declspec(align(16)) double c[4*12];

	double bb[200*12];
	double cc[4*12];

	for(int i=0; i < 800; i++)
		a[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 200*12; i++)
		bb[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 4*12; i++)
		c[i] = cc[i] = rand()*1.0/RAND_MAX-0.5;

	skew2x2(c, 4, 12);
	transpose200x4(bb,200,b); 
	transpose200x4(bb+800,200,b+800); 
	transpose200x4(bb+1600,200,b+1600); 

	mult4x200x12(a, b, c);

	easymult(a, bb, cc, 4, 200 , 12);

	skew2x2(c, 4, 12);
	skew2x2(c, 4, 12);

	array_diff(c, cc, 48);
	double rerr = array_max(c, 48)/array_max(cc, 48);
	return rerr;
}

/*
 * returns relative error
 */
double test600x200x12(){
	__declspec(align(16)) double a[600*200];
	__declspec(align(16)) double b[200*12];
	__declspec(align(16)) double C[600*12];
	__declspec(align(16)) double scratch[7200];
  
	double aa[600*200];
	double bb[200*12];
	double cc[600*12];
  
	for(int i=0; i < 600*200; i++)
		aa[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 200*12; i++)
		bb[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 600*12; i++)
		C[i] = cc[i] =  rand()*1.0/RAND_MAX-0.5;

	/*
	 * pack aa into a
	 */
	for(int i=0; i < 600; i++)
		for(int j=0; j < 200; j++){
			a[(i/4)*4*200+i%4+j*4] = aa[i+j*600];
		}
 
	skew2x2(C, 600, 12);
	transpose200x4(bb,200,b); 
	transpose200x4(bb+800,200,b+800); 
	transpose200x4(bb+1600,200,b+1600); 

	mult600x200x12(a, b, C, 600, scratch);

	easymult(aa, bb, cc, 600, 200, 12);

	//unskew C
	skew2x2(C, 600, 12);
	skew2x2(C, 600, 12);

	array_diff(C, cc, 600*12);
	double rerr = array_max(C, 600*12)/array_max(cc, 600*12);
	return rerr;
}
/*
 * returns relative error
 */
double test600x200x3000(){
	__declspec(align(16)) double A[600*200];
	__declspec(align(16)) double b[200*3000];
	__declspec(align(16)) double C[600*3000];
	__declspec(align(16)) double scratch[600*200+7200];

	double CC[600*3000];
	double bb[200*3000];

	for(int i=0; i < 600*200; i++)
		A[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 200*3000; i++)
		bb[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 600*3000; i++)
		C[i] = CC[i] = rand()*1.0/RAND_MAX-0.5;

	/*
	 * pack bb into b
	 */
	for(int i=0; i < 750; i++)
		transpose200x4(bb+i*800,200,b+i*800);

	skew2x2(C, 600, 3000);

	mult600x200x3000(A, 600, b, C, 600, scratch);

	easymult(A, bb, CC, 600, 200, 3000);

	skew2x2(C, 600, 3000);
	skew2x2(C, 600, 3000);
	
	array_diff(C, CC, 600*3000);
	double rerr = array_max(C, 600*3000)/array_max(CC, 600*3000);

	return rerr;
}

/*
 * returns rel error
 */
double test3000x200x3000(){
	__declspec(align(16)) double A[3000*200];
	int ldA = 3000;
	__declspec(align(16)) double B[200*3000];
	int ldB = 200;
	__declspec(align(16)) double C[3000*3000];
	__declspec(align(16)) double scratch[200*3000+600*200+7200];
	int ldC = 3000;

	double CC[3000*3000];

	for(int i=0; i < 3000*200; i++)
		A[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 200*3000; i++)
		B[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < 3000*3000; i++)
		C[i] = CC[i] = rand()*1.0/RAND_MAX-0.5;

	skew2x2(C, 3000, 3000);

	mult3000x200x3000(A, ldA, B, ldB, C, ldC, scratch);

	easymult(A, B, CC, 3000, 200, 3000);

	skew2x2(C, 3000, 3000);
	skew2x2(C, 3000, 3000);

	array_diff(C, CC, 3000*3000);
	double rerr = array_max(C, 3000*3000)/array_max(CC, 3000*3000);

	return rerr;
}

/*
 * returns rel err for 6000x6000x6000 mult
 */
double testblock(){
	const int l = 6000;
	const int m = 6000;
	const int n = 6000;

	__declspec(align(16)) double A[l*m];
	__declspec(align(16)) double B[m*n];
	__declspec(align(16)) double C[l*n];

	double CC[l*n];

	__declspec(align(16)) double scratch[600*12+600*200+200*3000];

	for(int i=0; i < l*m; i++)
		A[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < m*n; i++)
		B[i] = rand()*1.0/RAND_MAX-0.5;
	for(int i=0; i < l*n; i++){
		C[i] = CC[i] = rand()*1.0/RAND_MAX-0.5;
	}

	skew2x2(C, l, n);

	blockmult(A, B, C, l, m, n, scratch);

	easymult(A, B, CC, l, m, n);

	skew2x2(C, l, n);
	skew2x2(C, l, n);

	array_diff(C, CC, l*n);
	double rerr = array_max(C, l*n)/array_max(CC, l*n);

	return rerr;
}

int main(){
	double rerr;

	printf("\t\t\t rel errors in block mult by stage\n");
	
	rerr = test4x200x12();
	printf("\t rel error in 4x200x12       = %.2e\n", rerr);
	
	rerr = test600x200x12();
	printf("\t rel error in 600x200x12     = %.2e\n", rerr);

	rerr = test600x200x3000();
	printf("\t rel error in 600x200x3000   = %.2e\n", rerr);

	rerr = test3000x200x3000();
	printf("\t rel error in 3000x200x3000  = %.2e\n", rerr);

	rerr = testblock();
	printf("\t rel error in 6000x6000x6000 = %.2e\n", rerr);
}
