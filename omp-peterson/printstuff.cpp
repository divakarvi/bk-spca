#include <omp.h>
#include <cstdio>

void printstuff(){
	int x;
#pragma omp parallel				\
	num_threads(2)				\
	default(none)				\
	shared(x)
	{
		int tid = omp_get_thread_num();
		if(tid==0){
			x = 0;
		}
		else if(tid==1){
			x = 1;
			printf("x = %d\t", x);
			printf("x = %d\n", x);
		}
	}
}

int main(){
	printstuff();
}
