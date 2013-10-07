#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "sumcopy.hh"
#include <mkl.h>

enum sumcopy_enum {SUM, SUMSTR, SUMCONSTSTR, COPY, COPYCONSTSTR};

void init_mem(double *(&a), double *(&b), int n){
	long nbytes = 1l*n*sizeof(double);
	a = (double *)MKL_malloc(nbytes, 64);
	b = (double *)MKL_malloc(nbytes, 64);
	for(int i=0; i < n; i++)
		a[i] = i;
}

void release_mem(){
	MKL_free(a);
	MKL_free(b);
}

void time(double *a, double *b, int n, enum sumcopy_enum flag){
	const  int count = 100;

	StatVector stats(count);
	TimeStamp clk;
	double s;

	for(int i=0; i < count; i++){
		clk.tic();
		switch(flag){
		case SUM:
			s = sum(a, n);
			break;
		case SUMSTR:
			s = sumstride(a, n, STR); 
			break;
		case SUMCONSTSTR:
			s = sumconststide(a, n);
			break;
		case COPY:
			copy(a, b, n);
			break;
		case COPYCONSTSTR:
			copyconststride(a, b, n);
			break;
		}
		double cycles = clk.toc();
		stats.insert(cycles);
	}
	
}

void time(){
	cout<<"const stride = "<<STR<<endl;
	
	const long int n = 1024*1024*1024;
	double a[n], b[n];
	const int count = 10;
	for(long  int i=0; i < n; i++)
		a[i] = 1.0*i;
	
	TimeStamp clk;
	StatVector stats(count);
	double cycles;
	if(STR==1){
		for(int i=0; i < count; i++){
			clk.tic();
			double s = sum(a,n);
			cycles = clk.toc();
			stats.insert(cycles);
		}
		stats.print("sum of list");
		cycles = stats.median();
		cout<<"bytes per cycle = "<<8.0*n/cycles<<endl<<endl;
		stats.flush();
	}
	
	int stride = STR;
	for(int i=0; i < count; i++){
		clk.tic();
		double s = sumstride(a,n,stride);
		cycles = clk.toc();
		stats.insert(cycles);
	}
	
	stats.print("sum of list with stride=STR");
	cycles = stats.median();
	cout<<"bytes per cycle = "<<8.0*n/stride/cycles<<endl<<endl;
	stats.flush();
	
	for(int i=0; i < count; i++){
		clk.tic();
		double s = sumconststride(a,n);
		cycles = clk.toc();
		stats.insert(cycles);
	}
	stats.print("sum of list with const stride");
	cycles = stats.median();
	cout<<"bytes per cycle = "<<8.0*n/STR/cycles<<endl<<endl;
	stats.flush();
	
	if(STR==1){
		for(int i=0; i < count; i++){
			clk.tic();
			copy(a,b,n);
			cycles = clk.toc();
			stats.insert(cycles);
		}
		stats.print("copy list to list");
		cycles = stats.median();
		cout<<"bytes per cycle = "<<16.0*n/cycles<<endl<<endl;
		stats.flush();
	}
	
	for(int i=0; i < count; i++){
		clk.tic();
		copyconststride(a,b,n);
		cycles = clk.toc();
		stats.insert(cycles);
	}
	stats.print("copy const stride list to list");
	cycles = stats.median();
	cout<<"bytes per cycle = "<<16.0*n/STR/cycles<<endl<<endl;
	stats.flush();
}

int main(){
	const char* rows[] = {"all", "stride", "STRIDE",
			      "copy all", "copy STRIDE"};
	const char* cols[] = {"1e9 doubles"};

	
}
