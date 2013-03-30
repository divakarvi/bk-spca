#include <iostream>
#include "TimeStamp.hh"
#include <omp.h>
using namespace std;
#include "dvmesg.h"

#define DV_KERNEL_MESG
const int nprocs = 2;
const int nthreads = 4;


void addone(void *arg){
	long *p = (long *)(arg);
	*p += 1;
}

void addtwo(void *arg){
	long *p = (long *)(arg);
	*p += 2;
}

void ompmaster(long *list, int nthreads, int count){
	for(int i=0; i < count/2;i++){
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(list)
		{
			int j = omp_get_thread_num();
			addone((void *)(list+j));
		}
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)				\
	shared(list)
		{
			int j = omp_get_thread_num();
			addtwo((void *)(list+j));
		}
	}
}

int main(){
	long list[nthreads]={0};
	int count = (nthreads<=nprocs)?1000*1000*10:1000; 

#ifdef DV_KERNEL_MESG
	count = 6;
	ompmaster(list, nthreads, count);
	set_dvflag(400);
	ompmaster(list, nthreads, count);
	set_dvflag(0);
#else
	TimeStamp clk;
	clk.tic();
	ompmaster(list, nthreads, count);
	double cycles = clk.toc();
	cout<<"nprocs = "<<nprocs<<endl;
	cout<<"nthreads = "<<nthreads<<endl;
	cout<<"count = "<<count<<endl;
	cout<<"cycles per parallel region = "<<cycles/count<<endl;
#endif

	for(int i=0; i < nthreads; i++)
		cout<<list[i]<<endl;

}
