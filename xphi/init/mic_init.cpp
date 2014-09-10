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
#include "mic_init.hh"
#include <offload.h>
#include <omp.h>

int gl_host_nthreads = -1;
int gl_mic_nthreads = -1;

void mic_init(int &nmic){
	char *s = getenv("OMP_NUM_THREADS");
	assrt(s != NULL);
	gl_host_nthreads = atoi(s);
	omp_set_num_threads(gl_host_nthreads);

	nmic = _Offload_number_of_devices();
	s = getenv("MIC_OMP_NUM_THREADS");
	assrt(s != NULL);
	gl_mic_nthreads = atoi(s);
	for(int i=0; i < nmic; i++)
		omp_set_num_threads_target(TARGET_MIC, i, gl_mic_nthreads);
}

void mic_exit(){
	gl_host_nthreads = -1;
	gl_mic_nthreads = -1;
}
