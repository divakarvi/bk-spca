/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

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
		     volatile int interested[2]);
#endif
