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

#include "../../utils/TimeStamp.hh"
#include "overhead.hh"
#include <omp.h>

extern void dummy();

double barrier(int nthreads, int count){
	double cycles;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(count, cycles) 
	{
		TimeStamp clk;
/* barrier to protect clk */
#pragma omp barrier 
#pragma omp master
		clk.tic();
		for(int i=0; i < count; i++){
			dummy();
/* barrier inside for loop, this one is timed */
#pragma omp barrier    
		}
#pragma omp master
		cycles = clk.toc();
	}
	return cycles;
}

double nobarrier(int nthreads, int count){
	double cycles;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(count, cycles) 
	{
		TimeStamp clk;
/* barrier to protect clk */
#pragma omp barrier
#pragma omp master
		clk.tic();
		for(int i=0; i < count; i++){
			dummy();
		}
#pragma omp master
		cycles = clk.toc();
	}
	return cycles;
}

double barrier_overhead(int nthreads, long int count){
	double b = barrier(nthreads, count);
	double nb = nobarrier(nthreads, count);
	return (b-nb)/count;
}
