#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "latency_utils.hh"
#include <mkl.h>

extern dummy(int *a, int n);

void cache_flush(void *ptr, int nbytes){
#ifdef MEMWALK
	int *a = new int[1000*1000*1000];
	dummy(a, 1000*1000*1000);
	delete[] a;
#else
	for(int i=0; i < nbytes; i++)
		_mm_clflush(ptr+i);
#endif
}

/*
 * single measurement of latency using n pages
 */
double latency(int n){
	/*
	 * n*4096/64 = n*64 cache lines in 4096 byte page
	 */
	int *list = new int[n*64];
	random_cycle(list, n*64);

	int *npages = (int *)MKL_malloc(n*4096, 4096);
	assrt((long)npages%4096 == 0);
	/*
	 * create a random cycle between cache lines
	 */
	for(int i=0; i < 64*n; i++)
		npages[16*i] = list[i];

	cache_flush(npages, n*4096);
	
	int index = 17;
	TimeStamp clk;
	clk.tic();
	for(int i=0; i < 64*n; i++){
		index = npages[16*index];
	}
	double cycles = clk.toc();
	assrt(index == 17);

	MKL_free(npages);
	delete[] list;
	
	return cycles/(64*n);
}
