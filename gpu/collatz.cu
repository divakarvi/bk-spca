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
#ifndef NUMBLOCKS
#define NUMBLOCKS 14
#endif
#define CLKSPD 1.147
#include <iostream>
#include <cassert>
#include <cstdlib>
using namespace std;
#include "dvhstmem.hh"
#include "hstTimer.hh"
#include "dvTimer.hh"

//list size must equal NUMTHREADS*32*NUMBLOCKS
//NUMTHREADS must be a multiple of 32
__global__ void 
__launch_bounds__(NUMTHREADS, 1536/NUMTHREADS)
collatzstride(int *list,  int niter){
  const int N = NUMTHREADS*32;
  int fst = N*blockIdx.x;
  int id = threadIdx.x;
  __shared__ int smemlist[N];
  for(int i=0; i < 32; i++)
    smemlist[NUMTHREADS*i+id] = list[fst+NUMTHREADS*i+id];
  
  for(int j=0; j < niter; j++)
    for(int i=0; i < 32; i++){//each thread works on 32 entries
      int x = smemlist[NUMTHREADS*i+id];
      if(x >= 0){
	x = 3*x+1;
	if(x > 1024*1024*256)
	  x=-1;
	else{
	  while(x%2==0)
	    x = x/2;
	}
	smemlist[NUMTHREADS*i+id] = x;
      }
    }
  for(int i=0; i < 32; i++)
    list[fst+NUMTHREADS*i+id] = smemlist[NUMTHREADS*i+id];
}

//list size must equal NUMTHREADS*32*NUMBLOCKS
//NUMTHREADS must be a multiple of 32
__global__ void 
__launch_bounds__(NUMTHREADS, 1536/NUMTHREADS)
collatzblock(int *list,  int niter){
  const int N = NUMTHREADS*32;
  int fst = N*blockIdx.x;
  int id = threadIdx.x;
  __shared__ int smemlist[N];
  for(int i=0; i < 32; i++)
    smemlist[NUMTHREADS*i+id] = list[fst+NUMTHREADS*i+id];
  
  for(int j=0; j < niter; j++)
    for(int i=0; i < 32; i++){//each thread works on 32 entries
      int x = smemlist[id*32+i];
      if(x >= 0){
	x = 3*x+1;
	if(x > 1024*1024*256)
	  x=-1;
	else{
	  while(x%2==0)
	    x = x/2;
	}
	smemlist[id*32+i] = x;
      }
    }
  for(int i=0; i < 32; i++)
    list[fst+NUMTHREADS*i+id] = smemlist[NUMTHREADS*i+id];
}

extern __shared__ char dynamicsharedmemory[];

//list size must equal NUMTHREADS*32*NUMBLOCKS
//NUMTHREADS must be a multiple of 32
__global__ void 
__launch_bounds__(NUMTHREADS, 1536/NUMTHREADS)
collatzdynamic(int *list,  int niter){
  const int N = NUMTHREADS*32;
  int fst = N*blockIdx.x;
  int id = threadIdx.x;
  int *smemlist;
  smemlist = (int *)(dynamicsharedmemory);
  for(int i=0; i < 32; i++)
    smemlist[NUMTHREADS*i+id] = list[fst+NUMTHREADS*i+id];
  
  for(int j=0; j < niter; j++)
    for(int i=0; i < 32; i++){//each thread works on 32 entries
      int x = smemlist[NUMTHREADS*i+id];
      if(x >= 0){
	x = 3*x+1;
	if(x > 1024*1024*512)
	  x=-1;
	else{
	  while(x%2==0)
	    x = x/2;
	}
	smemlist[NUMTHREADS*i+id] = x;
      }
    }
  for(int i=0; i < 32; i++)
    list[fst+NUMTHREADS*i+id] = smemlist[NUMTHREADS*i+id];
}

void runcollatz(int flag){
  dvhstmem<int> dhlist(NUMTHREADS*NUMBLOCKS*32);
  int *dlist = dhlist.device();
  int *hlist = dhlist.host();
  for(int i=0; i < NUMTHREADS*NUMBLOCKS*32; i++)
    hlist[i] = ((rand()*1.0)/RAND_MAX)*1000*1000;
  for(int i=0; i < 10; i++)
    cout<<"hlist[i] = "<<hlist[i]<<endl;
  cout<<endl;
  dhlist.host2device();
  int niter = 1000*1000;

  cout.width(30);
  cout<<"NUMTHREADS = "<<NUMTHREADS<<endl;
  cout.width(30);
  cout<<"NUMBLOCKS = "<<NUMBLOCKS<<endl;
  double telapsed;
  if(flag==0){
    hstTimer clk;
    clk.tic();
    collatzstride<<<NUMBLOCKS, NUMTHREADS>>>(dlist, niter);
    telapsed = clk.toc();
  }
  else if(flag==1){
    hstTimer clk;
    clk.tic();
    collatzblock<<<NUMBLOCKS, NUMTHREADS>>>(dlist, niter);
    telapsed = clk.toc();
  }
  else if(flag==2){
    hstTimer clk;
    clk.tic();
    collatzdynamic<<<NUMBLOCKS, NUMTHREADS, NUMTHREADS*32*4>>>(dlist, niter);
    telapsed = clk.toc();
  }
  cout.width(30);
  cout<<"telapsed = "<<telapsed<<" milliseconds"<<endl;
  cout.width(30);
  cout<<"iterations per cycle = "<<32.0*niter*NUMTHREADS*NUMBLOCKS/(telapsed*1e-3)/(CLKSPD*1e9)<<endl;
  cout<<endl;
  
  dhlist.device2host();
  for(int i=0; i < 10; i++)
    cout<<"hlist[i] = "<<hlist[i]<<endl;
  double avg = 0;
  for(int i=0; i < 32*NUMTHREADS*NUMBLOCKS; i++){
    if((hlist[i]!=1)&&(hlist[i]!=-1))
      cout<<"entry = "<<i<<" is neither 1 nor -1"<<endl;
    avg += hlist[i];
  }
  avg /= 32*NUMTHREADS*NUMBLOCKS;
  cout<<"avg = "<<avg<<endl;
}

int main(){
  runcollatz(0);
  runcollatz(1);
  runcollatz(2);
}
