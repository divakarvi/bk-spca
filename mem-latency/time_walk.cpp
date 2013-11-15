#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "latency_utils.hh"
#include "array_walk.hh"
#include <cstdio>
#include <cstdlib>

enum strideflag_enum {UNITSTRIDE, STRIDE16};
void time_stride(enum strideflag_enum flag){
	int *a = new int[1000*1000*1000];

	for(int i=0; i < 1000*1000*1000; i++)
		a[i] = 0;

	TimeStamp clk;
	clk.tic();
	int stride;
	switch(flag){
	case UNITSTRIDE:
		stride = 1;
		unitstride(a);
		break;
	case STRIDE16:
		stride = 16;
		stride16(a);
		break;
	}
	double cycles = clk.toc();

	printf("\t\t\tsum a[i], i = i + stride, from i=0 to 10^9\n");
	printf("\t\t\tstride = %d\n", stride);
	printf("\tcycles per array access = %.2f\n\n", 
	       cycles/(1e9/stride)); 

	delete[] a;
}

void time_chain(){
	/*
	 * 10^9 random entries
	 */
	long int *list;
	long int n = 1000*1000*1000;
	list = (long int*)_mm_malloc(n*sizeof(long int), 64);
	for(long int i=0; i < n; i++)
		list[i] = rand();

	printf("\t\t\t chained access of array of size 10^9\n");
	printf("\t\t\t each entry is in [0,RAND_MAX]\n");
	printf("\t\t\t10^9/RAND_MAX = %f\n",1.0*n/RAND_MAX);
	
	int count = 6000;
	
	printf("\t\t\t number of accesses = %d\n", count);
	
	TimeStamp clk;
	clk.tic();
	double xx = chain_walk(list, n, count);
	double cycles = clk.toc();

	printf("\tcycles per access       =  %f\n", cycles/count);
	int repeats = countrepeats(list, n, count);
	printf("\tnumber of repeats       =  %d\n", repeats);
	double prob = probNoR(n, count);
	printf("\ttheor prob of 0 repeats =  %f\n\n", prob);

	_mm_free(list);
}

int main(){
	time_stride(UNITSTRIDE);
	time_stride(STRIDE16);
	time_chain();
}
