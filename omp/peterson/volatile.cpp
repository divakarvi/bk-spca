#include "volatile.hh"

void addx(int *restrict ptr, int *restrict list, int n){
	for(int i=0; i < n; i++)
		list[i] += *ptr;
}

void vaddx(volatile int *restrict ptr, int *restrict list, int n){
	for(int i=0; i < n; i++)
		list[i] += *ptr;
}

