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

#include "leibniz_init.hh"
#include <cstdio>
#include <omp.h>

/*
 * a = 4.0^(1.0/3.0)
 */
__declspec(target(mic)) const double gl_scl = 1.5874010519681994;

__declspec(target(mic))
double mic_sum(double *v, long len){
	printf("     mic pointer v = %p \n", v);
	double sum = 0;
	
#pragma omp parallel for			\
	reduction(+:sum)
	for(long i=0; i < len; i++)
		sum += v[i];

	return sum;
}

__declspec(target(mic))
void hostmic_scale(double *v, long len){
	printf("host/mic pointer v = %p \n", v);

#pragma omp parallel for
	for(long i=0; i < len; i++)
		v[i] *= gl_scl;
	
#pragma omp parallel
#pragma omp master
	printf("    num of threads = %d\n",omp_get_num_threads());
}

void leibniz_init(double *v, long len){
#pragma omp parallel for
	for(long i=0; i < len; i+=2){
		v[i] = 1.0/(2*i+1);
		v[i+1] = - 1.0/(2*i+3);
	}
}
