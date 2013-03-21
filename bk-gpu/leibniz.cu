#ifndef NUMTHREADS
#define NUMTHREADS 1024
#endif
#ifndef NUMBLOCKS
#define NUMBLOCKS 16
#endif
#define CLKSPD 1.301
#include <iostream>
#include <cassert>
#include <cstdlib>
using namespace std;
#include "dvhstmem.hh"
#include "hstTimer.hh"
#include "dvTimer.hh"


__global__ void 
__launch_bounds__(NUMTHREADS, NUMBLOCKS/16)
leibniz(long int n, double *result){
  int tid = threadIdx.x+blockIdx.x*blockDim.x;
  double ans=0;
  int step = blockDim.x*gridDim.x;
  for(long int i=tid; i < n; i+=step)
    ans = ans + 4.0/(2.0*i+1.0);
  if(tid%2==1)
    ans = -ans;
  result[tid] = ans;
}


//result and lock must be pointers to global memory 
//*result and *lock must be initialized to zero
__device__ void atomicAddDoubleDeadLock(double value, volatile double *result, volatile int *lock){
  int lockcopy=1;
  while(lockcopy==1)
    lockcopy = atomicExch((int *)lock, 1);
  *result += value;
  atomicExch((int *)lock, 0);
}


//result and lock must be pointers to global memory 
//*result and *lock must be initialized to zero
__device__ void atomicAddDouble(double value, volatile double *result, volatile int *lock){
  for(int i=0; i < 32; i++){
    if(threadIdx.x%32==i){
      int lockcopy=1;
      while(lockcopy==1)
	lockcopy = atomicExch((int *)lock, 1);
      *result += value;
      atomicExch((int *)lock, 0);
    }
  }
}

//result and lock must be initialized to zero.
__global__ void 
__launch_bounds__(NUMTHREADS, NUMBLOCKS/16)
leibniztotal(long int n, double* result, int* lock){
  int tid = threadIdx.x+blockIdx.x*blockDim.x;
  double ans=0;
  int step = blockDim.x*gridDim.x;
  for(long int i=tid; i < n; i+=step)
    ans = ans + 4.0/(2.0*i+1.0);
  if(tid%2==1)
    ans = -ans;
  atomicAddDouble(ans, result, lock);
}

__global__ void 
__launch_bounds__(NUMTHREADS, NUMBLOCKS/16)
leibnizfloat(int n, float *result){
  int tid = threadIdx.x+blockIdx.x*blockDim.x;
  float ans=0;
  int step = blockDim.x*gridDim.x;
  for(int i=tid; i < n; i+=step)
    ans = ans + 4.0f/(2.0f*i+1.0f);
  if(tid%2==1)
    ans = -ans;
  result[tid] = ans;
}

void runleibniz(long int n){
  double *dresult, *result;
  dvhstmem<double> dhmem(NUMTHREADS*NUMBLOCKS);
  dresult = dhmem.device();
  result = dhmem.host();


  hstTimer nvclk;
  nvclk.tic();  
  leibniz<<<NUMBLOCKS, NUMTHREADS>>>(n, dresult);
#ifdef DEBUG
    printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
  double telapsed = nvclk.toc(); 
  dhmem.device2host();
  double ans=0;
  for(int i=0; i < NUMBLOCKS*NUMTHREADS; i++)
    ans += result[i];
  cout.width(30);
  cout<<"leibniz partial sum = "<<ans<<endl;
  cout.width(30);
  cout<<"NUMTHREADS = "<<NUMTHREADS<<endl;
  cout.width(30);
  cout<<"NUMBLOCKS = "<<NUMBLOCKS<<endl;
  cout.width(30);
  cout<<"Time elapsed = "<<telapsed<<" milliseconds"<<endl;
  cout.width(30);
  cout<<"Cycles per term = "<<telapsed/n*(CLKSPD*1e6)<<endl;
  cout.width(30);
  cout<<"Warp cycles per term = "<<
    telapsed/n*(CLKSPD*1e6)*NUMTHREADS*NUMBLOCKS/32<<endl;
}

void runleibniztotal(long int n){
  double *dresult, *result;
  dvhstmem<double> dhmem(1);
  dresult = dhmem.device();
  result = dhmem.host();
  *result = 0;
  dhmem.host2device();

  dvhstmem<int> dhmemi(1);
  int *dlock = dhmemi.device();
  int *hlock = dhmemi.host();
  *hlock = 0;
  dhmemi.host2device();

  cout.width(40);
  cout<<endl<<"Leibniz in blocks"<<endl;
  hstTimer nvclk;
  nvclk.tic();  
  leibniztotal<<<NUMBLOCKS,NUMTHREADS>>>(n, dresult, dlock);
#ifdef DEBUG
  printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
  cout.width(30);
  cout<<"Time elapsed = "<<nvclk.toc()<<" milliseconds"<<endl;
  dhmem.device2host();
  cout.width(30);
  cout<<"leibniz partial sum = "<<*result<<endl;
}

void runleibnizfloat(int n){
  float *dresult, *result;
  dvhstmem<float> dhmem(NUMTHREADS*NUMBLOCKS);
  dresult = dhmem.device();
  result = dhmem.host();
  cout<<endl;
  cout.width(40);
  cout<<"Leibniz in single precision"<<endl;
  hstTimer nvclk;
  nvclk.tic();  
  leibnizfloat<<<NUMBLOCKS, NUMTHREADS>>>(n, dresult);
#ifdef DEBUG
    printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
  double telapsed = nvclk.toc(); 
  dhmem.device2host();
  float ans=0;
  for(int i=0; i < NUMBLOCKS*NUMTHREADS; i++)
    ans += result[i];
  cout.width(30);
  cout<<"leibniz partial sum = "<<ans<<endl;
  cout.width(30);
  cout<<"NUMTHREADS = "<<NUMTHREADS<<endl;
  cout.width(30);
  cout<<"NUMBLOCKS = "<<NUMBLOCKS<<endl;
  cout.width(30);
  cout<<"Time elapsed = "<<telapsed<<" milliseconds"<<endl;
  cout.width(30);
  cout<<"Cycles per term = "<<telapsed/n*(CLKSPD*1e6)<<endl;
  cout.width(30);
  cout<<"Warp cycles per term = "<<
    telapsed/n*(CLKSPD*1e6)*NUMTHREADS*NUMBLOCKS/32<<endl;
}

int main(){
  long int n = 1000*1000*1000;
  n = n*10;
  //runleibniz(n);
  runleibniztotal(n);
  //int m = 1024*1024*512*3;
  //runleibnizfloat(m);
}
