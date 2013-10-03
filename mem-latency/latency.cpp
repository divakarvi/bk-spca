#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "latency_utils.hh"
#include "latency.hh"

extern void dummy(int *a, int n);

void cache_flush(void *ptr, int nbytes){
#ifdef MEMWALK
	int *a = new int[1000*1000*1000];
	dummy(a, 1000*1000*1000);
	delete[] a;
#else
	for(int i=0; i < nbytes; i++)
		_mm_clflush((char *)ptr+i);
#endif
}

/*
 * single measurement of latency using n pages
 */
double latency(int n, int *npages){
	assrt((long)npages%4096 == 0);
	/*
	 * n*4096/64 = n*64 cache lines in 4096 byte page
	 */
	int *list = new int[n*64];
	random_cycle(list, n*64);

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

	delete[] list;
	
	return cycles/(64*n);
}
