#include <fstream>
#include <iomanip>
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include "TimeStamp.hh"
#include "StatVector.hh"
using namespace std;

#define GEN_OUTPUT
const double CPUGHZ=3.33;

void write_direct(double *v, long len, const char *fname){
	FILE *fptr;
	fptr = fopen(fname, "w");
	fwrite((void *)v, len, sizeof(double), fptr);
	fclose(fptr);
}

void read_direct(double *v, long len, const char *fname){
	FILE *fptr;
	fptr = fopen(fname, "r");
	fread((void *)v, len, sizeof(double), fptr);
	fclose(fptr);
}


void v_init(double *v, long len){
	for(long i=0; i < len; i++){
		v[i] = (rand()*1.0/RAND_MAX-0.5)*2.0;
	}
}

double v_avg(double *v, long len){
	double avg = 0;
	for(long i=0; i < len; i++)
		avg += v[i];
	avg /= len;
	return avg;
}
