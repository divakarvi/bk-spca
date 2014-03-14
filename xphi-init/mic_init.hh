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

#ifndef __MICINIT8DEC2013__
#define __MICINIT8DEC2013__

extern int gl_host_nthreads;
extern int gl_mic_nthreads;
/*
 * cycle factor = 2.70/1.10 for stampede
 */
#define MIC_CYCLE_FACTOR (2.4545454545454545) 
/*
 * OMP_NUM_THREADS --> gl_host_threads --> omp_set_num_threads()
 * MIC_OMP_NUM_THREADS --> gl_mic_threads 
 *                     --> omp_set_num_threads_target() for each mic device
 * nmic = num of mic devices
 */
void mic_init(int &nmic);
void mic_exit();
#endif

