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

#include "addcopy.hh"

__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void addblock(double *list, int n, double *result){
	int tid = threadIdx.x + blockIdx.x*blockDim.x;
	int tcount = n/(blockDim.x*gridDim.x);
	int fst = tid*tcount;
	int last = fst + tcount;
	double ans = 0;
	for(int i=fst; i < last; i++)
		ans += list[i];
	result[tid] = ans;
}

__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void addstride(double *list, int n, double *result){
	int tid = threadIdx.x + blockIdx.x*blockDim.x;
	int stride = blockDim.x*gridDim.x;
	double ans = 0;
	for(int i=tid; i < n; i = i + stride)
		ans += list[i]; 
	result[tid] = ans;
}


