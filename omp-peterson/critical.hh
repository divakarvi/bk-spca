#ifndef __critical16Oct2013__
#define __critical16Oct2013__

/*
 * tid = 0 or 1
 * yield = each thread attempts to yield
 * interested[] = each thread declares interest when entering critical region
 * does not use mfence to serialize loads and stores
 */
void enter_critical(int tid, 
		    volatile int& yield, 
		    volatile int interested[2]);

/*
 * tid = 0 or 1
 * yield = ignored
 * interested[2] = each thread turns of interested[tid] at exit
 */
void exit_critical(int tid, 
		   volatile int& yield, 
		   volatile int interested[2]);

/*
 * same as enter_critical, but with appropriate mfence instructions
 * to get a correct implementation of Peterson's algorithm
 */
void enter_criticalx(int tid, 
		     volatile int& yield, 
		     volatile int interested[2])
#endif
