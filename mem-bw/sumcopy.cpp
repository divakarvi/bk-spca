#include "sumcopy.hh"

double sum(double *restrict a, long int n){
	double s = 0;
	for(long int i=0; i < n; i++)
		s += a[i];
	return s;
}

double sumstride(double *restrict a, long int n, int stride){
	double s = 0;
	for(long int i=0; i < n; i+=stride)
		s += a[i];
	return s;
}

double sumconststride(double *restrict a, long int n){
	double s = 0;
	for(long int i=0; i < n; i+=STR)
		s += a[i];
	return s;
}

void copy(double *restrict a, double *restrict b, long int n){
	for(long int i=0; i < n; i++)
		b[i] = a[i];
}

void copyconststride(double *restrict a, double *restrict b, long int n){
	for(long int i=0; i < n; i+=STR)
		b[i] = a[i];
}

