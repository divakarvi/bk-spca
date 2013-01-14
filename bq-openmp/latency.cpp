#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include <xmmintrin.h>
#include <emmintrin.h>
#include <mkl.h>

using namespace std;

void latency(int *FourPages){
  int List[256];
  for(int i=0; i < 256; i ++)
    List[i] = (i*66239)%256;
  int LList[256];
  for(int i=0; i < 256; i++)
    LList[List[i]]=List[(i+1)%256];
  for(int i=0; i < 256; i++)
    FourPages[16*i] = LList[i];
  for(int i=0; i < 4096; i++)
    _mm_clflush(FourPages+i);
  int index = 17;
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < 256; i++){
    index = FourPages[16*index];
  }
  double cycles = clk.toc();
  cout<<"index = "<<index<<endl;
  cout<<"cycles per access = "<<cycles/256<<endl;
}

int main(){
  int *FourPages = (int *)MKL_malloc(4096*sizeof(int), 4096);
#pragma omp parallel    \
  num_threads(2)	\
  shared(FourPages)
  {
  #pragma omp single 
    for(int i=0; i < 4096; i++)
      FourPages[i] = i;
  #pragma omp critical
    latency(FourPages);
  }
  MKL_free(FourPages);
}
