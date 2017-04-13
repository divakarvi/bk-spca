#include "mesg.hh"
#include <cstdio>

int main(){
	printf("****** forking with neither mutexes nor spinlocks ******\n");
	fork_pthreads();
	printf("\n\n");
	printf("****** forking with mutexes ******\n");
	fork_pthreads_mutex();
	printf("\n\n");
	printf("****** forking with spinlocks ******\n");
	fork_pthreads_spinlock();
}

