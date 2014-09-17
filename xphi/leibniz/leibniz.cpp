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
#include "../init/mic_init.hh"
#include "leibniz_init.hh"
#include <offload.h>
#include <cstdio>
#include <omp.h>

void leibniz1(){
	int nmic;
	mic_init(nmic);
	long n = 1l*1000*1000*800;
	long nbytes = n*8;
	double* v = (double *)_mm_malloc(nbytes, 64);
	leibniz_init(v, n);
	
	double sum; 
#pragma offload target(mic:0)					\
	mandatory						\
	in(v:length(n) align(64))	
	{
		hostmic_scale(v, n);
		hostmic_scale(v, n);
		hostmic_scale(v, n);
		sum = hostmic_sum(v, n);
	}

	printf("    leibniz1:  sum = %f\n", sum);
	_mm_free(v);
	mic_exit();
}

void leibniz2(){
	int nmic;
	mic_init(nmic);
	long n = 1l*1000*1000*800;
	long nbytes = n*8;
	double* v = (double *)_mm_malloc(nbytes, 64);
	leibniz_init(v, n);
	
	double sum=-1;
#pragma offload target(mic:0)					\
	in(v:length(n) align(64))				\
	signal(v)
	{
		hostmic_scale(v, n);
		hostmic_scale(v, n);
		hostmic_scale(v, n);
		sum = hostmic_sum(v, n);
	}

#pragma offload_wait target(mic:0)  wait(v)
	printf("    leibniz2:  sum = %f\n", sum);

	_mm_free(v);
	mic_exit();
}


void leibniz3(){
	int nmic;
	mic_init(nmic);
	assrt(nmic > 0);
	long n = 1l*1000*1000*800;
	long nbytes = n*8;
	printf("            nbytes = %ld\n",nbytes);
	double* v = (double *)_mm_malloc(nbytes, 64);
	leibniz_init(v, n);
	printf("    host pointer v = %p \n", v);

#pragma offload target(mic:0)					\
	in(v:length(n) align(64) alloc_if(1) free_if(0))
	{}

#pragma offload target(mic:0) nocopy(v:length(n) alloc_if(0) free_if(0))
	hostmic_scale(v, n);

#pragma offload target(mic:0)					\
	out(v:length(n) align(64) alloc_if(0) free_if(0))
	hostmic_scale(v, n);
	
	hostmic_scale(v, n);
	
	double sum;
#pragma offload target(mic:0)					\
	in(v:length(n) align(64) alloc_if(0) free_if(1))
	sum = hostmic_sum(v, n);

	printf("               sum = %f\n", sum);
	_mm_free(v);
	mic_exit();
}



void leibniz4(){
	int nmic;
	mic_init(nmic);
	long n = 1l*1000*1000*800;
	long nbytes = n*8;
	double* v = (double *)_mm_malloc(nbytes, 64);
	leibniz_init(v, n);

	double sum[nmic];

	/*
	 * alloc mem on mic devices
	 */
	for(int mc=0; mc < nmic; mc++){
		long shft = mc*n/nmic;
		long len = (mc+1)*n/nmic - mc*n/nmic;
#pragma offload_transfer target(mic:mc)				\
	nocopy(v[shft:len]:align(64) alloc_if(1) free_if(0))
	}

	/*
	 * offload scaling and summing to mic devices
	 */
	for(int mc=0; mc < nmic; mc++){ 
		long shft = mc*n/nmic;
		long len = (mc+1)*n/nmic - mc*n/nmic;
#pragma offload target(mic:mc)						\
	in(v[shft:len]:alloc_if(0) free_if(0))				\
	out(sum[mc:1])							\
	signal(1)
		{
			hostmic_scale(v+shft, len);
			hostmic_scale(v+shft, len);
			hostmic_scale(v+shft, len);
			sum[mc] = hostmic_sum(v+shft, len);
		}
	}

	printf("              nmic = %d\n", nmic);

	/*
	 * wait for mics to get back
	 */
	for(int mc=0; mc < nmic; mc++){
#pragma offload_wait target(mic:mc)  wait(1)
	}

	/*
	 * free mem on mic devices
	 */
	for(int mc=0; mc < nmic; mc++){
		long shft = mc*n/nmic;
		long len = (mc+1)*n/nmic - mc*n/nmic;
#pragma offload_transfer target(mic:mc)				\
	nocopy(v[shft:len]:align(64) alloc_if(0) free_if(1))
	}

	double ans = 0;
	for(int mc=0; mc < nmic; mc++)
		ans += sum[mc];
	printf("     leibniz4: sum = %e\n", ans);

	_mm_free(v);
	mic_exit();
}


int main(){
	//leibniz1();
	//leibniz2();
	leibniz3();
	//leibniz4();
}
