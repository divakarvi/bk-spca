#include "../../utils/utils.hh"
#include "leibniz.hh"
#include <omp.h>

//leibniz.hh.
double parallelfor(long int n, int nthreads){
	double ans=0;
#pragma omp parallel for			\
	num_threads(nthreads)			\
	schedule(static)			\
	default(none)				\
	shared(n)				\
	reduction(+:ans)
	for(long int i=0; i < n; i = i+2)
		{
			ans += 4.0/(2*i+1);
			ans -= 4.0/(2*i+3);
		}
	return ans;
}

//leibniz.hh.
double ompfor(long int n){
	double ans=0;
#pragma omp parallel				\
	default(none)				\
	shared(n, ans)				
	{
		double sum=0;
#pragma omp for
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

//leibniz.hh.
double ompforchunk(long int n, int chunk){
	double ans=0;
#pragma omp parallel				\
	default(none)				\
	shared(n, ans, chunk)		   
	{
		double sum = 0;
#pragma omp for					\
	schedule(static, chunk)
		for(long int i=0; i < n; i = i+2){
			sum += 4.0/(2*i+1);
			sum -= 4.0/(2*i+3);
		}
#pragma omp critical
		ans += sum;
	}
	return ans;
}


