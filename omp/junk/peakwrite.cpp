#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include <xmmintrin.h>
#include <emmintrin.h>
#include <mkl.h>
#include <omp.h>
using namespace std;

//R must be "%xmmi" 0<=i<=15
#define zeroxmm(R)				\
  asm volatile("xorps %" R ", %" R "\n\t":::R);

//R1 and R2 must be "%xmmi" 0<=i<=15 
#define addxmm(R1, R2)					\
  asm volatile("addpd %" R1 ", %" R2 "\n\t":::R1, R2);

//R = "%xmmi" 0<=i<=15
//a = double * (16 byte aligned)
#define loadxmm(a, R)					\
  asm volatile("movaps %0, %" R "\n\t"::"m"(*(a)):R);	

//R = "%xmmi" 0<=i<=15xmm
//a = double * (16 byte aligned)
#define storexmm(R, a)					\
  asm volatile("movntpd %" R ", %0 \n\t":"=m"(*(a))::R);	

void onecore(double *list, long int n){
  assert(n%8==0);
  zeroxmm("%xmm0");
  for(long int i=0; i < n; i = i+8){
    storexmm("%xmm4", list+i);
    storexmm("%xmm5", list+i+2);
    storexmm("%xmm6", list+i+4);
    storexmm("%xmm7", list+i+6);
  }
}

void onecore_stride(double *list, long int n, int stride){
  assert(n%8==0);
  zeroxmm("%xmm0");
  for(long int i=0; i < n; i = i+8*stride){
    storexmm("%xmm4", list+i);
    storexmm("%xmm5", list+i+2);
    storexmm("%xmm6", list+i+4);
    storexmm("%xmm7", list+i+6);
  }
}

//bandwidth in bytes per cycle
void bw_onecore(long int n){
  double *list = (double *)MKL_malloc(n*sizeof(double), 4096);
  for(long int i=0; i < n; i++)
    list[i] = rand()*1.0/RAND_MAX;
  for(long int i=0; i < n; i++)
    _mm_clflush(list+i);
  TimeStamp clk;
  clk.tic();
  onecore(list, n);
  double cycles = clk.toc();
  cout<<"bandwidth = "<<n*8.0/cycles<<" bytes/cycle"<<endl;
  MKL_free(list);
}


//bandwidth in bytes per0cycle
//blksize is cache line size units
void bw_onecore_stride(long int n, int stride){
  double *list = (double *)MKL_malloc(stride*n*sizeof(double), 4096);
  for(long int i=0; i < stride*n; i++)
    list[i] = rand()*1.0/RAND_MAX;
  for(long int i=0; i < stride*n; i++)
    _mm_clflush(list+i);
  TimeStamp clk;
  clk.tic();
  onecore_stride(list, stride*n, stride);
  double cycles = clk.toc();
  cout<<"bandwidth = "<<n*8.0/cycles<<" bytes/cycle"<<endl;
  MKL_free(list);
}

//with 2*m cores
void bw_evencore_numa_block(long int n, int m){
  double *glist = (double *)MKL_malloc(2*m*n*sizeof(double), 4096);
#pragma omp parallel				\
  num_threads(2*m)				\
  default(none)					\
  shared(n, glist, cout)
  {
    int tid = omp_get_thread_num();
    double *list = glist + (tid%2)*m*n;
    list = list + n*(tid/2);
    int stride = m;
    for(long int i=0; i < n; i=i++)
	list[i] = 2.0*(tid+1)*rand()/RAND_MAX;
    for(long int i=0; i < n; i++)
	_mm_clflush(list+i);
  #pragma omp barrier

    TimeStamp clk;
    clk.tic();
  #pragma omp barrier 
    onecore(list, n);
  #pragma omp barrier
  #pragma omp critical
    {
      double cycles = clk.toc();
      cout<<"tid = "<<tid<<" bandwidth = "<<
	2.0*m*n*8.0/cycles<<" bytes/cycle"<<endl;
    }
  }
  MKL_free(glist);
}

int main(int argc, char** argv){
  if(argc < 2){
    cout<<"Usage: "<<argv[0]<<" nthreads"<<endl;
    return -1;
  }
  int ncore = atoi(*++argv);
  long int n = 4096*1024*3*3*2;
  switch(ncore){
  case 1:
    cout<<"bw_onecore()"<<endl;
    bw_onecore(n);
    cout<<"bw_onecore_stride(n,2)"<<endl;
    bw_onecore_stride(n,2);
    cout<<"bw_onecore_stride(n,3)"<<endl;
    bw_onecore_stride(n,3);
    break;
  case 2:
    cout<<"bw_evencore_numa_block(n,1)"<<endl;
    bw_evencore_numa_block(n,1);
    break;
  case 4:
    cout<<"bw_evencore_numa_block(n,2)"<<endl;
    bw_evencore_numa_block(n,2);
    break;
  case 6:
    cout<<"bw_evencore_numa_block(n,3)"<<endl;
    bw_evencore_numa_block(n,3);
    break;
  case 8:
    cout<<"bw_evencore_numa_block(n,4)"<<endl;
    bw_evencore_numa_block(n,4);
    break;
  case 10:
    cout<<"bw_evencore_numa_block(n,5)"<<endl;
    bw_evencore_numa_block(n,5);
    break;
  case 12:
    cout<<"bw_evencore_numa_block(n, 6)"<<endl;
    bw_evencore_numa_block(n,6);
    break;
  }
  
}
