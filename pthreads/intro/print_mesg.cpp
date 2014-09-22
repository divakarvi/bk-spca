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
