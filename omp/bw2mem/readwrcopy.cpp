#include <cstdio>
#include <omp.h>

void init_manycore(double *list, long len, int nthreads){
#pragma omp parallel for			\
	num_threads(nthreads)			\
	default(none)				\
	shared(list, len, nthreads)
	for(long i=0; i < len; i++){
		int tid = omp_get_thread_num();
		double x;
		if(tid < nthreads/2)
			x = tid + 1;
		else
			x = -nthreads + tid;
		list[i] = 1.0*rand()/RAND_MAX*x;
	}
}

void init_manycore_cheap(double *list, long len, int nthreads){
#pragma omp parallel for			\
	num_threads(nthreads)			\
	default(none)				\
	shared(list, len, nthreads)
	for(long i=0; i < len; i++)
		list[i] = i/7.0;
}

double sum_onecore(double *list, long n){
	double ans = 0;
#pragma vector always
	for(long i=0; i < n; i++)
		ans += list[i];
	return ans;
}

double sum_manycore(double *list, long len, int nthreads){
	double ans = 0;
	
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(ans, list, len, nthreads)
	{
		int tid = omp_get_thread_num();
		long first = len*tid/nthreads;
		long next = len*(tid+1)/nthreads;
		double s = sum_onecore(list+first, next-first);
#pragma omp critical
		ans += s;
	}
	return ans;
}

void write_onecore(double *list, long n){
#pragma vector always nontemporal
	for(long i=0; i < n; i++)
		list[i] = i;
}

void write_manycore(double *list, long len, int nthreads){
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(list, len, nthreads)
	{
		int tid = omp_get_thread_num();
		long first = len*tid/nthreads;
		long next = len*(tid+1)/nthreads;
		write_onecore(list+first, next-first);
	}
}

void copy_onecore(double *list, long n){
#pragma vector always nontemporal
	for(long i=0; i < n/2; i++)
		list[i] = list[n/2+i];
}

void copy_manycore(double *list, long len, int nthreads){
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(list, len, nthreads)
	{
		int tid = omp_get_thread_num();
		long first = len*tid/nthreads;
		long next = len*(tid+1)/nthreads;
		copy_onecore(list+first, next-first);
	}
}

