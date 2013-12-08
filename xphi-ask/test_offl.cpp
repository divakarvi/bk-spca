#include <offload.h>
#include <cstdio>
#include <omp.h>

void mic_init(){
	omp_set_num_threads(16);

	int nmic = _Offload_number_of_devices();
	for(int i=0; i < nmic; i++)
		omp_set_num_threads_target(TARGET_MIC, i, 244);
}

__declspec(target(mic))
double mic_sum(double *v, long len){
	double sum = 0;
	
#pragma omp parallel for			\
	reduction(+:sum)
	for(long i=0; i < len; i++)
		sum += v[i];
	
	return sum;
}

double find_sum(double x){
       long nbytes = 1l*4000*1000*1000;
       double *v = (double *)_mm_malloc(nbytes, 64);
       long len = nbytes/8;

#pragma omp parallel for
       for(long i=0; i < len; i+=2){
	       v[i] = x*1.0/(2*i+1);
	       v[i+1] = - x*1.0/(2*i+3);
       }
       
       double sum;
#pragma offload target(mic:0)					\
	inout(v:length(len) align(64) alloc_if(1) free_if(1))	\
	in(len)							\
	out(sum)
       sum = mic_sum(v, len);
       
       _mm_free(v);

       return(sum);
}

int main(){
	mic_init();

	int niters = 1000;
	for(int i=1; i <= niters; i++){
		double sum = find_sum(i*1.0);
		printf("%d*PI/4\t= %f\n", i, sum); 
	}
}
