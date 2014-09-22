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
#include "lusolve.hh"
#include <unistd.h>
#include <cstdlib>

void testlu(int n){
	double *A = new double[n*n];
	double *v = new double[n];
	for(int i = 0; i < n; i++){
		v[i] = rand()*1.0/RAND_MAX-0.5;
		for(int j = 0; j < n; j++)
			A[i+j*n] = rand()*1.0/RAND_MAX - 0.5;
	}
	verify_dir("DBG/");
	array_out(A, n, n, "DBG/A.dat");

	LU_Solve lu(A, n);
	lu.factorize();
	array_out(v, n, 1, "DBG/b.dat");
	lu.solve(v);
	array_out(v, n, 1, "DBG/x.dat");

	system("test_lusolve.py DBG/A.dat DBG/b.dat DBG/x.dat");

	delete[] v;
	delete[] A;
}

int main(){
	testlu(10);
	testlu(100);
	testlu(200);
}
