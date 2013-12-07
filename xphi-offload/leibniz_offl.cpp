#include "../utils/utils.hh"
#include <offload.h>
#include <cstdio>
#include <iostream>
#include <omp.h>

__declspec(target(mic))
double mic_sum(double *v, long len){
	printf(" mic pointer v = %p \n", v);
	double sum = 0;
	
#pragma omp parallel for			\
	reduction(+:sum)
	for(long i=0; i < len; i++)
		sum += v[i];
	
	return sum;
}

__declspec(target(mic))
void hostmic_scale(double *v, long len){
	printf("host/mic pointer v = %p \n", v);
#pragma omp parallel for
	for(long i=0; i < len; i++)
		v[i] *= 2.0;
	
#pragma omp parallel
#pragma omp master
	std::cout<<"num of threads = "<<omp_get_num_threads()<<std::endl;
}

void mic_init(){
	char *s = getenv("OMP_NUM_THREADS");
	assrt(s != NULL);
	omp_set_num_threads(atoi(s));

	int nmic = _Offload_number_of_devices();
	s = getenv("MIC_OMP_NUM_THREADS");
	assrt(s != NULL);
	for(int i=0; i < nmic; i++)
		omp_set_num_threads_target(TARGET_MIC, i, atoi(s));
}

int main(){
	//mic_init();
	
	long n = 1l*1000*1000*100;
	long nbytes = n*8;
	double* v = (double *)_mm_malloc(nbytes, 64);
	
#pragma omp parallel for
	for(long i=0; i < n; i += 2){
		v[i] = 1.0/(2*i+1);
		v[i+1] = - 1.0/(2*i+3);
	}

	printf("host pointer v = %p \n", v);

#pragma offload target(mic:0)					\
	in(v:length(n) align(64) alloc_if(1) free_if(0))

#pragma offload target(mic:0) nocopy(v)
	hostmic_scale(v, n);

#pragma offload target(mic:0)					\
	out(v:length(n) align(64) alloc_if(0) free_if(0))

	hostmic_scale(v, n);
	
	double sum;
#pragma offload target(mic:0)					\
	in(v:length(n) align(64) alloc_if(0) free_if(1))
	sum = mic_sum(v, n);

	printf("           sum = %f\n", sum);

	_mm_free(v);
}
