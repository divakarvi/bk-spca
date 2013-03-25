#include <iostream>
#include "StatVector.hh"
#include "TimeStamp.hh"
#include <omp.h>
using namespace std;

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
  num_threads(nthreads)				\
  default(none)					\
  shared(list)
    {
      int j = omp_get_thread_num();
      addone((void *)(list+j));
    }
#pragma omp parallel				\
  num_threads(nthreads)				\
  default(none)					\
  shared(list)
    {
      int j = omp_get_thread_num();
      addtwo((void *)(list+j));
    }
  }
}

int main(){
  const int nthreads = 3;
  long list[nthreads];
  int count = 1000*1000; count = 1000;
  for(int i=0; i < nthreads; i++)
    list[i] = 0;
  TimeStamp clk;
  clk.tic();
  ompmaster(list, nthreads, count);
  double cycles = clk.toc();
  cout<<"cycles per parallel region = "<<cycles/count<<endl;
  for(int i=0; i < nthreads; i++)
    cout<<list[i]<<endl;
}
