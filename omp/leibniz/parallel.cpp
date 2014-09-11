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
#include "leibniz.hh"
#include <omp.h>

double parallel(long int n, int nthreads){
	assrt(nthreads%2==0);
	double ans=0;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(n, nthreads, ans)
	{
		double sum=0;
		int offset = omp_get_thread_num();
		for(long int i=offset; i < n; i=i+nthreads)
			sum += 4.0/(2*i+1);
#pragma  omp critical
		if(offset%2==0)
			ans += sum;
		else
			ans -= sum;
	}
	return ans; 
}

void partialsum(int offset, long int n, int nthreads, 
		double & ans){
	double sum = 0;
	for(long int i=offset; i < n; i=i+nthreads)
		sum += 4.0/(2*i+1);
#pragma  omp critical
	if(offset%2==0)
		ans += sum;
	else
		ans -= sum;
}

double parallelX(long int n, int nthreads){
	assrt(nthreads%2==0);
	double ans=0;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(n, nthreads, ans)
	{
		int offset = omp_get_thread_num();
		partialsum(offset, n, nthreads, ans);
	}
	return ans; 
}
