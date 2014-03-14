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
