/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#ifndef NUMTHREADS
#define NUMTHREADS 384
#endif
#define CLKSPD 1.147
#include <iostream>
#include <cassert>
#include <cstdlib>
using namespace std;
#include "dvhstmem.hh"
#include "hstTimer.hh"
#include "dvTimer.hh"

__global__ void 
__launch_bounds__(NUMTHREADS, 1536/NUMTHREADS)
addblock(double *list, int n, double *result){
  int tid = threadIdx.x + blockIdx.x*blockDim.x;
  int blksize = n/(blockDim.x*gridDim.x);
  int fst = tid*blksize;
  int last = fst + blksize;
  double ans = 0;
  for(int i=fst; i < last; i++)
    ans += list[i];
  result[tid] = ans;
}

__global__ void 
__launch_bounds__(NUMTHREADS, 1536/NUMTHREADS)
addstride(double *list, int n, double *result){
  int tid = threadIdx.x + blockIdx.x*blockDim.x;
  int stride = blockDim.x*gridDim.x;
  double ans = 0;
  for(int i=tid; i < n; i = i + stride)
    ans += list[i]; 
  result[tid] = ans;
}

__global__ void 
__launch_bounds__(NUMTHREADS, 1536/NUMTHREADS)
addstride4(double *list, int n, double *result){
  int tid = threadIdx.x + blockIdx.x*blockDim.x;
  int stride = blockDim.x*gridDim.x;
  double ans0 = list[tid];
  double ans1 = list[tid+stride];
  double ans2 = list[tid+2*stride];
  double ans3 = list[tid+3*stride];
  result[tid] = ans0 + ans1 + ans2 + ans3;
}

void runaddstride(long int n, int NUMBLOCKS, int flag){
  double *dresult, *hresult;
  dvhstmem<double> dhresult(NUMTHREADS*NUMBLOCKS);
  dresult = dhresult.device();
  hresult = dhresult.host();
  double *hlist, *dlist;
  dvhstmem<double> dhlist(n);
  hlist = dhlist.host();
  dlist = dhlist.device();
  for(int i=0; i < n; i++)
    hlist[i] = rand()*1.0/RAND_MAX-0.5;//or try hlist[i]=i+1;
  dhlist.host2device();
  
  double telapsed = 1e100;
  for(int i = 0; i < 10; i++){//10 trials 
    double tintvl;
    hstTimer hclk;
    if(flag==-1){
      hclk.tic();  
      addblock<<<NUMBLOCKS, NUMTHREADS>>>(dlist, n, dresult);
#ifdef DEBUG
      printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
      tintvl=hclk.toc();
    }
    else if(flag==0){
      hclk.tic(); 
      addstride<<<NUMBLOCKS, NUMTHREADS>>>(dlist, n, dresult);
#ifdef DEBUG
      printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
      tintvl=hclk.toc();
    }
    else if(flag==1){
      hclk.tic(); 
      addstride4<<<NUMBLOCKS, NUMTHREADS>>>(dlist, n, dresult);
#ifdef DEBUG
      printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
      tintvl=hclk.toc();
    }
    cout.width(30);
    cout<<"tintvl = "<<tintvl<<endl;
    if(tintvl < telapsed)
      telapsed = tintvl;
  }

  dhresult.device2host();
  double ans=0;
  for(int i=0; i < NUMBLOCKS*NUMTHREADS; i++)
    ans += hresult[i];
  cout.width(30);
  cout<<"List average = "<<ans/n<<endl;
  cout.width(30);
  cout<<"Time elapsed = "<<telapsed<<" milliseconds"<<endl;
  cout.width(30);
  cout<<"Bandwidth to memory = "<<(n+NUMTHREADS*NUMBLOCKS)*8.0/(telapsed/1000)/(CLKSPD*1e9)<<" bytes/cycle"<<endl;
  cout.width(30);
  cout<<"Bandwidth to memory = "<<(n+NUMTHREADS*NUMBLOCKS)*8.0/(telapsed/1000)/1e9<<" GB/s"<<endl;
}


int main(){
  int NUMBLOCKS = 56;
  int n = NUMTHREADS*NUMBLOCKS*4000;
  cout.width(30);
  cout<<"n = "<<n<<endl;
  cout.width(30);
  cout<<"NUMTHREADS = "<<NUMTHREADS<<endl;
  cout.width(30);
  cout<<"NUMBLOCKS = "<<NUMBLOCKS<<endl;
  cout.width(40);
  cout<<"add in blocks per thread"<<endl;
  runaddstride(n,NUMBLOCKS, -1);
  cout.width(40);
  cout<<"strided add"<<endl;
  runaddstride(n,NUMBLOCKS, 0);
  

  
  cout<<endl<<endl;
  NUMBLOCKS = 56000;
  n = NUMTHREADS*NUMBLOCKS*4;
  cout.width(30);
  cout<<"n = "<<n<<endl;
  cout.width(30);
  cout<<"NUMTHREADS = "<<NUMTHREADS<<endl;
  cout.width(30);
  cout<<"NUMBLOCKS = "<<NUMBLOCKS<<endl;
  cout.width(40);
  cout<<"add in blocks per thread"<<endl;
  runaddstride(n,NUMBLOCKS, -1);
  cout.width(40);
  cout<<"strided add"<<endl;
  runaddstride(n,NUMBLOCKS, 0);
  cout.width(40);
  cout<<"strided add 4"<<endl;
  runaddstride(n,NUMBLOCKS, 1);
}
