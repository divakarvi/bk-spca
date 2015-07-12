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

#include <cstdio>
extern void dummy(void *a);

/*
 * this program may be used to check the size of the stack
 * below it checks if the stack is 8 GB
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
