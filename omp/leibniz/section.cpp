#include "../../utils/utils.hh"
#include "leibniz.hh"
#include <omp.h>

double section(long int n){
	double ans=0;
#pragma omp parallel				\
	num_threads(2)				\
	default(none)				\
	shared(n, ans)                                
	{
		double sum=0;
#pragma omp sections
		{
#pragma omp section
			for(long int i=0; i < n; i=i+2)
				sum += 4.0/(2*i+1);
#pragma omp section
			for(long int i=1; i < n; i=i+2)
				sum -= 4.0/(2*i+1);
		}
#pragma omp critical
		ans += sum;
	}
	return ans;
}
