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

#include "../utils/utils.hh"
#include "leibniz.hh"
#include <omp.h>

double section(long int n){
	double ans=0;
#pragma omp parallel				\
	num_threads(2)				\
	default(none)				\
	shared(n, ans)                                
	{
		double sum=0;
#pragma omp sections
		{
#pragma omp section
			for(long int i=0; i < n; i=i+2)
				sum += 4.0/(2*i+1);
#pragma omp section
			for(long int i=1; i < n; i=i+2)
				sum -= 4.0/(2*i+1);
		}
#pragma omp critical
		ans += sum;
	}
	return ans;
}
