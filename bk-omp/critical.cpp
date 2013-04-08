#include "TimeStamp.hh"
#include <iostream>
#include <cassert>
#include <omp.h>
#include <cstdio>
using namespace std;

void printstuff(){
	int x;
#pragma omp parallel				\
	num_threads(2)				\
	default(none)				\
	shared(x)
	{
		int tid = omp_get_thread_num();
		if(tid==0){
			x = 0;
		}
		else if(tid==1){
			x = 1;
			printf("x = %d\t", x);
			printf("x = %d\n", x);
		}
	}
}

extern void addx(int *ptr, int *list, int n);

extern void vaddx(volatile int *ptr, int *list, int n);

//tid must be 0 or 1
void enter_critical(int tid, 
		    volatile int& yield, 
		    volatile int interested[2]){
	interested[tid] = 1;
	int other = 1 - tid;
	yield = tid;
	while((yield==tid) && (interested[other]==1));
}

void exit_critical(int tid, 
		   volatile int& yield, 
		   volatile int interested[2]){
	interested[tid] = 0;
}



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

//tid must be 0 or 1
void enter_criticalx(int tid, 
		     volatile int& yield, 
		     volatile int interested[2]){
	interested[tid] = 1;
	int other = 1 - tid;
	yield = tid;
	//#pragma omp flush
	asm volatile("cpuid"::"a"(0x01):"ebx", "ecx","edx");
	while((yield==tid) && (interested[other]==1));
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
	int x = 7;
	int list[] = {1,2,3,4,5};
	addx(&x, list, 5);
	vaddx(&x, list, 5);
	cout<<list[0]
	    <<" "<<list[1]
	    <<" "<<list[2]
	    <<" "<<list[3]
	    <<" "<<list[4]<<endl;
	printstuff();
	long n = 1;
	for(int i=0; i < 3; i++){
		n *= 1000;
		cout<<"n = "<<n<<endl;
		long ans;
		ans = withcritical(n);
		cout<<"withcritical = "<<ans<<endl;
		ans = withcriticalx(n);
		cout<<"withcriticalx = "<<ans<<endl;
		cout<<endl;
	}
}
