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

#include "array_walk.hh"

int unitstride(int *a){
	int sum=0;
	for(int i=0; i < 1000*1000*1000; i++)
		sum += a[i];
	return sum;
}

int stride16(int *a){
	int sum=0;
	for(int i=0; i < 1000*1000*1000; i+=16)
		sum += a[i];
	return sum;
}

//list must be 64 byte aligned
double chain_walk(long int *list, long int n, int count){
	double x = 0;
	long int  index = 0;
	for(int i=0; i < count; i++){
		x += list[index];
		index = list[index]%n;
		index = index - index%8;
	}
	return x;
}
