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

#include "offl.hh"
#include <offload.h>

void alloc_micmem(double *v, long n, int nmic){
	long fst[nmic+1];
	for(int i=0; i <= nmic; i++)
		fst[i] = i*n/nmic;
	
	for(int mc=0; mc < nmic; mc++){
		long shft = fst[mc];
		long len = fst[mc+1] - fst[mc];
#pragma offload_transfer target(mic:mc)				\
	nocopy(v[shft:len]:align(64) alloc_if(1) free_if(0))
	}
}

void free_micmem(double *v, long n, int nmic){
	long fst[nmic+1];
	for(int i=0; i <= nmic; i++)
		fst[i] = i*n/nmic;
	
	for(int mc=0; mc < nmic; mc++){
		long shft = fst[mc];
		long len = fst[mc+1] - fst[mc];
#pragma offload_transfer target(mic:mc)				\
	nocopy(v[shft:len]:align(64) alloc_if(0) free_if(1))
	}
}

void xfer_in(double *v, long n, int nmic){
	long fst[nmic+1];
	for(int i=0; i <= nmic; i++)
		fst[i] = i*n/nmic;

	for(int mc=0; mc < nmic; mc++){
		long shft = fst[mc];
		long len = fst[mc+1] - fst[mc];
#pragma offload target(mic:mc)					\
	in(v[shft:len]:align(64) alloc_if(0) free_if(0))	\
	signal(1)
		dummy(v+shft, len);
		
	}

	for(int mc=0; mc < nmic; mc++){
#pragma offload_wait target(mic:mc) wait(1)
	}
}

void xfer_out(double *v, long n, int nmic){
	long fst[nmic+1];
	for(int i=0; i <= nmic; i++)
		fst[i] = i*n/nmic;

	for(int mc=0; mc < nmic; mc++){
		long shft = fst[mc];
		long len = fst[mc+1] - fst[mc];
#pragma offload target(mic:mc)					\
	out(v[shft:len]:align(64) alloc_if(0) free_if(0))	\
	signal(1)
		dummy(v+shft, len);
	}

	for(int mc=0; mc < nmic; mc++){
#pragma offload_wait target(mic:mc) wait(1)
	}
}

void xfer_inout(double *v, long n, int nmic){
	long fst[nmic+1];
	for(int i=0; i <= nmic; i++)
		fst[i] = i*n/nmic;

	for(int mc=0; mc < nmic; mc++){
		long shft = fst[mc];
		long len = fst[mc+1] - fst[mc];
#pragma offload target(mic:mc)					\
	inout(v[shft:len]:align(64) alloc_if(0) free_if(0))	\
	signal(1)
		dummy(v+shft, len);
	}

	for(int mc=0; mc < nmic; mc++){
#pragma offload_wait target(mic:mc) wait(1)
	}
}


