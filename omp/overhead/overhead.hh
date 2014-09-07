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

#ifndef __overhead16Oct2013__
#define __overhead16Oct2013__

/*
 * nthreads = num of threads
 * count = for loop count, barrier inside for loop
 */
double barrier_overhead(int nthreads, long int count);

/*
 * nthreads = num of threads
 * countinner = num of itns of omp for loop (body is a single call to dummy())
 * countouter = num of omp for loops timed.
 * the for loop is within a parallel region
 */
double ompfor_overhead(int nthreads, int countinner, long int countouter);

/*
 * same as above, but with nowait for construct
 */
double ompfornowait_overhead(int nthreads, long int countinner, 
			     long int countouter);

/*
 * use schedule(dynamic)
 */
double ompfordynamic_overhead(int nthreads, long int countinner, 
			      long int countouter);
#endif
