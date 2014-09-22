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

#include "../../utils/utils.hh"
#include <unistd.h>
#include <pthread.h>
#include <cstdio>

const int NTHREADS = 4;

struct leib_stuff{
	int offset;
	int n;
	double sum;
};

void *leibniz(void *arg){
	int offset = ((struct leib_stuff *)arg)->offset;
	int n = ((struct leib_stuff *)arg)->n;
	double sum = 0;

	for(int i=offset; i < n; i += NTHREADS)
		sum += 4.0/(2*i+1);

	((struct leib_stuff *)arg)->sum = sum;
	return arg;
}

double leibsum(int nterms){
	assrt(NTHREADS%2 == 0);
	
	pthread_t t[NTHREADS-1];
	struct leib_stuff linfo[NTHREADS-1];
	for(int i=1; i < NTHREADS; i++){
		linfo[i-1].offset = i;
		linfo[i-1].n = nterms;
		pthread_create(&(t[i-1]), NULL, leibniz, (void *)(linfo+(i-1)));
	}

	double ans = 0;
	for(int i=0; i < nterms; i+=NTHREADS)
		ans += 4.0/(2*i+1);
	
	void *res;
	pthread_join(t[0], &res);
	ans -= ((struct leib_stuff *)res)->sum;
	for(int i=2; i < NTHREADS; i+=2){
		pthread_join(t[i-1], &res);
		ans += ((struct leib_stuff *)res)->sum;
		pthread_join(t[i], &res);
		ans -= ((struct leib_stuff *)res)->sum;
	}
	
	return ans;
}

int main(){
	double ans = leibsum(1000*1000);
	printf("leibniz partial sum = %f \n", ans);
}
