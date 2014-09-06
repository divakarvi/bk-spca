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
