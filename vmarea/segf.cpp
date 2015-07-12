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

#include "segf.hh"
#include <cstdio>
#include <unistd.h>
#include <asm/unistd.h>


void ff0(long *a0, long *list, long n){
	for(int i=0; i < 1000; i++)
		a0[i] = 0;
	for(long i=0; i < n; i++)
		a0[list[i]] = list[i]*list[i]; 
	printf("in ff0: ");
	sum_arr(a0, 1000);
}

void f0(long *list, long n){
	long a0[1000];
	printf("a0 (in f0)= %p\n", a0);
	for(int i=0; i < 1000; i++)
		a0[i] = 0;
	asm volatile("cpuid"::"a"(0x01):"ebx", "ecx","edx");
	printf("pid (in f0) = %d\n", getpid());
	ff0(a0, list, n);
}

void f1(long *list, long n){
	long a1[1000*1000];
	for(int i=0; i < 1000*1000; i++)
		a1[i] = 0;
	f0(list, n);
	printf("in f1: ");
	sum_arr(a1, 1000*1000);
}

void f2(){
	long a1[1000*1000];
	for(int i=0; i < 1000*1000; i++)
		a1[i] = 0;
	printf("in f2: ");
	sum_arr(a1, 1000*1000);
}
