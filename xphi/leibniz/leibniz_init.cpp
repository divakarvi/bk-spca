#include "leibniz_init.hh"
#include <cstdio>
#include <omp.h>

/*
 * gl_scl = 4.0^(1.0/3.0).
 */
__declspec(target(mic)) const double gl_scl = 1.5874010519681994;

//leibniz_init.hh.
__declspec(target(mic))
double hostmic_sum(double *v, long len){
	printf("sum:host/mic pointer v = %p \n", v);
	double sum = 0;
	
#pragma omp parallel for			\
	reduction(+:sum)
	for(long i=0; i < len; i++)
		sum += v[i];

	return sum;
}

//leibniz_init.hh.
__declspec(target(mic))
void hostmic_scale(double *v, long len){
	printf("scale:host/mic pointer v = %p \n", v);

#pragma omp parallel for
	for(long i=0; i < len; i++)
		v[i] *= gl_scl;
	
#pragma omp parallel
#pragma omp master
	printf("    num of threads = %d\n",omp_get_num_threads());
}

//leibniz_init.hh.
void leibniz_init(double *v, long len){
#pragma omp parallel for
	for(long i=0; i < len; i+=2){
		v[i] = 1.0/(2*i+1);
		v[i+1] = - 1.0/(2*i+3);
	}
}

