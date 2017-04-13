#include "../../utils/Table.hh"
#include "critical.hh"
#include <omp.h>
#include <iostream>

long withcritical(long int n){
	volatile long  ans = 0;
	volatile int yield;
	volatile int interested[2]={0,0};
#pragma omp parallel      \
	num_threads(2)	  \
	default(none)				\
	shared(ans, n, yield, interested)
	{
		int tid = omp_get_thread_num();
		for(long int i=0; i < n; i++){
			enter_critical(tid, yield, interested);
			ans = ans+1;
			exit_critical(tid, yield, interested);
		}
	}
	return ans;
}

long withcriticalx(long int n){
	volatile long  ans = 0;
	volatile int yield;
	volatile int interested[2]={0,0};
#pragma omp parallel      \
	num_threads(2)	  \
	default(none)				\
	shared(ans, n, yield, interested)
	{
		int tid = omp_get_thread_num();
		for(long int i=0; i < n; i++){
			enter_criticalx(tid, yield, interested);
			ans = ans+1;
			exit_critical(tid, yield, interested);
		}
	}
	return ans;
}

int main(){
	const char *rows[3] = {"1000", "1000*1000", "1000*1000*1000"};
	const long n[3] = {1l*1000, 1l*1000*1000, 1l*1000*1000*1000};
	const char *cols[2] = {"critical", "criticalx"};
	double data[6];
	
	for(int i=0; i < 3; i++){
		data[i] = withcritical(n[i]);
		data[i+3] = withcriticalx(n[i]);
	}
	
	Table tbl;
	tbl.dim(3, 2);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	verify_dir("DBG");

	const char* fname = "DBG/critical.txt";
	link_cout(fname);
	std::cout.precision(10);
	tbl.print("value of variable after 2 threads add to it n times");
	unlink_cout();
}

