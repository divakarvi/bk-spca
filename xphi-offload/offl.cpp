#include <iostream>
#include <omp.h>

__declspec(target(mic))
double mic_sum(double *v, long len){
	double sum = 0;
	std::cout<<"mic sum: v = "<<v<<std::endl;

#pragma omp parallel for			\
	reduction(+:sum)
	for(long i=0; i < len; i++)
		sum += v[i];
	
	return sum;
}

__declspec(target(mic))
void mic_scale(double *v, long len){

	if(_Offload_get_device_number() >= 0)
		std::cout<<" mic scale: v = "<<v<<std::endl;
	else
		std::cout<<"host scale: v = "<<v<<std::endl;
       
#pragma omp parallel for
	for(long i=0; i < len; i++)
		v[i] *= 2.0;
}

int main(){
	long n = 1l*1000*1000*100;
	long nbytes = n*8;
	double* v = (double *)_mm_malloc(nbytes, 64);
	for(long i=0; i < n; i += 2){
		v[i] = 1.0/(2*i+1);
		v[i+1] = - 1.0/(2*i+3);
	}

	std::cout<<"host: v = "<<v<<std::endl;

#pragma offload target(mic)			\
	in(v:length(n) align(64) alloc_if(1) free_if(0))
	mic_scale(v, n);

#pragma offload target(mic)					\
	out(v:length(n) align(64) alloc_if(0) free_if(0))
	{}

	mic_scale(v, n);
	
	double sum;
#pragma offload target(mic)			\
	in(v:length(n) align(64) alloc_if(0) free_if(1))
	sum = mic_sum(v, n);

	std::cout<<"sum = "<<sum<<std::endl;

	_mm_free(v);
}
