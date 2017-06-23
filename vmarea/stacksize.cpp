#include <cstdio>
extern void dummy(void *a);

/*
 * Checks if the stack is 8 MB or more.
 */

int main(){
	const long N = 1l*1000*1000;
	printf("attempting to alloc %f bytes on the stack\n",
	       1.0*sizeof(long)*N);

	long a[N]; 
	for(long i=0; i < N; i++)
		a[i] = 0;

	dummy(a);
}

