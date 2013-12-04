#include <stdio.h>
#include <omp.h>

int main(){
#ifndef __MIC__
	omp_set_num_threads(16);
#else
	omp_set_num_threads(244);
#endif
#pragma omp parallel
	printf("hello from thread: %d of %d\n", 
	       omp_get_thread_num(), omp_get_num_threads());
}
