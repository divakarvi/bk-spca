#include "aitken.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

//n terms of Taylor series (x - x^2/2 + x^3/3 -...)
double partialSum(double x, int n){
	double sum, prod, sign;
	int i;
	sum = 0;
	prod = 1;
	for(i=1; i <= n; i++){
		prod *= x;
		sign = (i%2==0)?-1:1;
		sum += sign*prod/i;
	}
	return sum;
}

//extrapolate using first n partial sums
double extrapolateSum(double x, int n){
	double *seq1, *seq2, sum, prod, sign;
	int i;
	seq1 = malloc(sizeof(double)*n);
	seq2 = malloc(sizeof(double)*(n-2));
	sum = 0;
	prod = 1;
	for(i=1; i <= n; i++){
		prod *= x;
		sign = (i%2==0)?-1:1;
		sum += sign*prod/i;
		seq1[i-1] = sum;
	}
	sum = aitkenExtrapolate(seq1, seq2, n);
	free(seq1);
	free(seq2);
	return sum;
}

int main(){
	const int N = 10, n=13;
	int i; 
	double xlist[N+1], val1, val2, val3;
	xlist[N] = 1.25;
	for(i=0; i < N; i++)
		xlist[i] = 1.0*i/(N-1);
	
	printf("partial sum, extrapolated sum,  true value\n");
	for(i=0; i < N+1; i++){
		val1 = partialSum(xlist[i], n);
		val2 = extrapolateSum(xlist[i], n);
		val3 = log(1+xlist[i]);
		printf("\n %.10f    %.10f    %.10f \n", 
		       val1, val2, val3);
	}
}
