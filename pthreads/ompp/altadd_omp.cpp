#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../kernel-linux/syscall/dvmesg.h"
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <omp.h>
using namespace std;


#undef DV_KERNEL_MESG

int nthreads = num_cpu();
int nprocs = num_cpu();



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
	long list[nthreads];
	for(int i=0; i < nthreads; i++)
		list[i] = 0;
	int count = (nthreads<=nprocs)?1000*1000*100:1000*100; 

#ifdef DV_KERNEL_MESG
	count = 6;
	cout<<"tgid = "<<getpid()<<endl;
	ompmaster(list, nthreads, count);
	set_dvflag(400);
	ompmaster(list, nthreads, count);
	set_dvflag(0);
#else
	TimeStamp clk;
	clk.tic();
	ompmaster(list, nthreads, count);
	double cycles = clk.toc();
	verify_dir("DBG/");
	ofstream ofile("DBG/altadd_omp.txt", ios_base::app);
	ofile<<endl;
	ofile<<"nprocs = "<<nprocs<<endl;
	ofile<<"nthreads = "<<nthreads<<endl;
	ofile<<"count = "<<count<<endl;
	ofile<<"cycles per parallel region = "<<cycles/count<<endl;
	ofile.close();
#endif

	for(int i=0; i < nthreads; i++)
		cout<<list[i]<<endl;

}
