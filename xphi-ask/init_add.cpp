#include <omp.h>

void init_manycore_cheap(double *list, long len, int nthreads, double x){
#pragma omp parallel for			\
	num_threads(nthreads)			\
	default(none)				\
	shared(list, len, nthreads, x)
	for(long i=0; i < len; i++)
		list[i] = x;
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
	shared(ans, list, len)
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
