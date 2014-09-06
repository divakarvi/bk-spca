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

double ompfor(long int n,  int nthreads){
	double ans=0;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(n, ans)				
	{
		double sum=0;
#pragma omp for					\
	schedule(static)
		for(long int i=0; i < n; i = i+2)
			{
				sum += 4.0/(2*i+1);
				sum -= 4.0/(2*i+3);
			}
#pragma omp critical
		ans += sum;
	}
	return ans;
}


double ompforchunk(long int n,  int nthreads, int chunk){
	double ans=0;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(n, ans, chunk)		   
	{
		double sum = 0;
#pragma omp for					\
	schedule(static, chunk)
		for(long int i=0; i < n; i = i+2){
			sum += 4.0/(2*i+1);
			sum -= 4.0/(2*i+3);
		}
#pragma omp critical
		ans += sum;
	}
	return ans;
}




double parallelfor(long int n, int nthreads){
	double ans=0;
#pragma omp parallel for			\
	num_threads(nthreads)			\
	schedule(static)			\
	default(none)				\
	shared(n)				\
	reduction(+:ans)
	for(long int i=0; i < n; i = i+2)
		{
			ans += 4.0/(2*i+1);
			ans -= 4.0/(2*i+3);
		}
	return ans;
}
