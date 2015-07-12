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

#include <stdio.h>

void hanoi(int from, int to, int n){
	int other = 3-(from+to);
	if(n==1)
		printf("move from %d to %d \n", from, to);
	else{
		hanoi(from, other, n-1);
		printf("move from %d to %d \n", from, to);
		hanoi(other, to, n-1);
	}
}

int main(){
	int n;
	printf("n = ");
	scanf("%d", &n);
	hanoi(0, 1, n);
}