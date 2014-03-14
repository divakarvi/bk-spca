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

#ifndef __LUSOLVE27OCT2013__
#define __LUSOLVE27OCT2013__

class LU_Solve{
private:
	int dim;
	double *A;
	int *ipiv;
public:
	LU_Solve(double *a, int dimi);
	~LU_Solve();
	void factorize();
	void solve(double *v);
};

#endif
