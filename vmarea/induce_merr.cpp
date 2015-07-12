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

#include "maccess.hh"
#include <cstdio>
#include <cstdlib>

void run1(long n){
	long *a = (long *)malloc(5*sizeof(long));
	printf("a = %p \n", a);
	printf("page alignment = bndry + %ld \n", (long)a%4096);
	maccess(a, n);
	free(a);
}

int main(){
	printf("\t\ta[0...4] defined\n");
	printf("\t\ta[0..4] accesed\n");
	printf("\t\ta[n-1] accessed\n");
	long n;
	printf("n = ");
	scanf("%ld", &n);
	run1(n);
}
