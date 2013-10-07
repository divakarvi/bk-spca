#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "sumcopy.hh"
#include <mkl.h>


void init_mem(double *(&a), double *(&b),  int n){
	long nbytes = 1l*n*8;
	a = (double *)MKL_malloc(nbytes, 64);
	b = (double *)MKL_malloc(nbytes, 64);

	for(int i=0; i < n; i++)
		a[i] = i;
}

void release_mem(double *a, double *b){
	MKL_free(a);
	MKL_free(b);
}

enum sumcopy_enum {SUM, SUMSTR, SUMCONSTSTR, COPY, COPYCONSTSTR};

/*
 * returns memory bandwidth as bytes per cycle
 */
double time(double *a, double *b, int n, enum sumcopy_enum flag){
	const int count = 1;
	StatVector stats(count);
	TimeStamp clk;
	
	long bytes = 8l*n;
	for(int i=0; i < count; i++){
		clk.tic();
		switch(flag){
		case SUM:
			sum(a, n);
			break;
		case SUMSTR:
			sumstride(a, n, STR);
			break;
		case SUMCONSTSTR:
			sumconststride(a, n);
			break;
		case COPY:
			copy(a, b, n);
			bytes *= 2;
			break;
		case COPYCONSTSTR:
			copyconststride(a, b, n);
			bytes *= 2;
			break;
		}
		double cycles = clk.toc();
		stats.insert(cycles);
	}
	return bytes/stats.median();
}

int main(){
	const char* rows[5] = {"SUM", "SUMSTR", "SUMCONSTSTR", 
			       "COPY", "COPYCONSTSTR" }
	const char* cols[1] = {"n=1e9 doubles"};
	const int n = 1000*1000*1000;
	double *a, *b;
	init_mem(a, b, n);
	
	double bw[5];
	bw[0] = time(a, b, n, SUM);
	bw[1] = time(a, b, n, SUMSTR);
	bw[2] = time(a, b, n, SUMCONSTSTR);
	bw[3] = time(a, b, n, COPY);
	bw[4] = time(a, b, n, COPYCONSTSTR);

	Table tbl;
	tbl.dim(5, 1);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(bw);
	tbl.print()

	release_mem(a, b);

}
