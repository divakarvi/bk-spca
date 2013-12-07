#include <omp.h>
#include <iostream>

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


double find_sum(int nthreads, double x){
	long nbytes = 4l*1000*1000*1000;
	
	double *list = (double *)_mm_malloc(nbytes, 64);
	long len = nbytes/8;

	init_manycore_cheap(list, len, nthreads, x);
	double ans = sum_manycore(list, len, nthreads);

	_mm_free(list);
	return ans;
}

int main(){
	const int niters = 20;
#ifdef __MIC__
	int nthreads = 244;
#else
	int nthreads = 16;
#endif
	double sum = 0;
	for(int i=0; i < niters; i++){
		std::cout<<i<<std::endl;
		sum += find_sum(nthreads, (i+1.0));
	}

	std::cout<<"           computed sum = "<<sum<<std::endl;
	std::cout<<"nbytes implied by above = "<<sum/(niters+1)/niters*16
		 <<std::endl;
}
