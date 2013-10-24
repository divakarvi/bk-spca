#include "mesg.hh"
#include <cstdio>

int main(){
	fork_pthreads();
	printf("\n\n");
	fork_pthreads_mutex();
	printf("\n\n");
	fork_pthreads_spinlock();
}
