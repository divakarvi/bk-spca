#include "critical.hh"

void enter_critical(int tid, 
		    volatile int& yield, 
		    volatile int interested[2]){
	interested[tid] = 1;
	int other = 1 - tid;
	yield = tid;
	while((yield==tid) && (interested[other]==1));
}

void exit_critical(int tid, 
		   volatile int& yield, 
		   volatile int interested[2]){
	interested[tid] = 0;
}

void enter_criticalx(int tid, 
		     volatile int& yield, 
		     volatile int interested[2]){
	interested[tid] = 1;
	asm volatile("mfence");
	yield = tid;
	asm volatile("mfence");
	int other = 1 - tid;
	while((yield==tid) && (interested[other]==1));
}

