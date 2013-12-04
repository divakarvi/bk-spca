#include "../utils/utils.hh"
#include "leibniz.hh"
#include <omp.h>

double ompfor(long int n,  int nthreads){
	double ans=0;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(n, ans)				
	{
		double sum=0;
#pragma omp for					\
	schedule(static)
#pragma vector always
		for(long int i=0; i < n; i = i+2)
			{
				sum += 4.0/(2*i+1);
				sum -= 4.0/(2*i+3);
			}
#pragma omp critical
		ans += sum;
	}
	return ans;
}


double ompforchunk(long int n,  int nthreads, int chunk){
	double ans=0;
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(n, ans, chunk)		   
	{
		double sum = 0;
#pragma omp for					\
	schedule(static, chunk)
#pragma vector always
		for(long int i=0; i < n; i = i+2){
			sum += 4.0/(2*i+1);
			sum -= 4.0/(2*i+3);
		}
#pragma omp critical
		ans += sum;
	}
	return ans;
}




double parallelfor(long int n, int nthreads){
	double ans=0;
#pragma omp parallel for			\
	num_threads(nthreads)			\
	schedule(static)			\
	default(none)				\
	shared(n)				\
	reduction(+:ans)
#pragma vector always
	for(long int i=0; i < n; i = i+2)
		{
			ans += 4.0/(2*i+1);
			ans -= 4.0/(2*i+3);
		}
	return ans;
}
