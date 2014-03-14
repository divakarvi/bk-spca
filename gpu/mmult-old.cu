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

#include <iostream>
#include <cassert>
#include <cstdlib>
using namespace std;
#include <dvhstmem.hh>
#include <hstTimer.hh>
const int NUMTHREADS=1024;
const int NUMBLOCKS=14*14*2;
const int N=8*8*14;
const int NW=8*14;
const double CLKSPD=1.147;

//C += A*B
//square matrices of dim 8*14*8=64*14
//blockDim.x==NUMTHREADS must be 1024
//gridDim.x==NUMBLOCKS must be 14*14*2
//number of warps  in grid = 32*14*14*2
__global__ void
__launch_bounds__(NUMTHREADS, 1)
mmult(double *A, double *B, double *C){
  int warpid = threadIdx.x/32+blockIdx.x*32;
  int tid32 = threadIdx.x%32;
  int ib = (warpid%NW);
  int jb = (warpid/NW);
  ib *= 8;
  jb *= 8;
  int i = ib + tid32%8;
  int j = jb + tid32/8;
  for(int k = 0; k < N; k++){
    C[i+j*N] += A[i+k*N]*B[k+j*N];
    C[i+(j+4)*N] += A[i+k*N]*B[k+(j+4)*N];
  }
}

//C += A*B
//square matrices of dim 8*14*8=64*14
//blockDim.x==NUMTHREADS must be 1024
//gridDim.x==NUMBLOCKS must be 14*14*2
//number of warps  in grid = 32*14*14*2
__global__ void
__launch_bounds__(NUMTHREADS, 1)
mmultsmem(double *A, double *B, double *C){
  int warpid = (threadIdx.x/32)+blockIdx.x*32;
  int tid32 = threadIdx.x%32;
  int warpidinblk = threadIdx.x/32;
  __shared__ double smem[3*64*32];
  double *smemfst = smem+warpidinblk*3*64;
  double *smemA = smemfst;
  double *smemB = smemfst + 64;
  double *smemC = smemfst + 128;
  int ib = warpid%NW;
  int jb = warpid/NW;
  ib *= 8;
  jb *= 8;
  int ii = tid32%8;
  int jj = tid32/8;
  int i = ib + ii;
  int j = jb + jj;
  smemC[ii+jj*8] = C[i+j*N];
  smemC[ii+(jj+4)*8] = C[i+(j+4)*N];
  for(int kb=0; kb < N; kb += 8){
    int kk = tid32/8;
    int k = kb + kk;
    smemA[ii+8*kk] = A[i+N*k];
    smemA[ii+8*(kk+4)] = A[i+N*(k+4)];
    kk = tid32%8;
    k = kb+kk;
    smemB[kk+8*jj] = B[k+j*N];
    smemB[kk+8*(jj+4)] = B[k+(j+4)*N];
    for(kk=0; kk < 8; kk++){
      smemC[ii+8*jj] += smemA[ii+8*kk]*smemB[kk+8*jj];
      smemC[ii+8*(jj+4)] += smemA[ii+8*kk]*smemB[kk+8*(jj+4)];
    }
  }
  C[i+j*N] = smemC[ii+jj*8];
  C[i+(j+4)*N] = smemC[ii+(jj+4)*8];
}

void testmmult(){
  dvhstmem<double> mA(N*N);
  dvhstmem<double> mB(N*N);
  dvhstmem<double> mC(N*N);
  double *A = mA.host();
  double *B = mB.host();
  double *C = mC.host();
  double *dA = mA.device();
  double *dB = mB.device();
  double *dC = mC.device();
  for(int  i=0; i < N; i++)
    for(int j=0; j < N; j++){
      A[i+j*N] = 1;
      B[i+j*N] = 1;
      C[i+j*N] = 0;
    }
  mA.host2device();
  mB.host2device();
  mC.host2device();
  mmultsmem<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
  printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
  mmultsmem<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
  printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
  mmultsmem<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
  printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
  mC.device2host();
  cout<<"C[4] = "<<C[4]<<endl;
  cout<<"C[100004] = "<<C[100004]<<endl;
  for(int i=0; i < N*N; i++)
    if(C[i] != 2688)
      cout<<"error at i = "<<i<<" C[i] = "<<C[i]<<endl;
}

void runmmult(){
  dvhstmem<double> mA(N*N);
  dvhstmem<double> mB(N*N);
  dvhstmem<double> mC(N*N);
  double *A = mA.host();
  double *B = mB.host();
  double *C = mC.host();
  double *dA = mA.device();
  double *dB = mB.device();
  double *dC = mC.device();
  for(int  i=0; i < N; i++)
    for(int j=0; j < N; j++){
      A[i+j*N] = rand()*1.0/RAND_MAX-0.5;
      B[i+j*N] = rand()*1.0/RAND_MAX-0.5;
      C[i+j*N] = 0;
    }
  const int count = 100;
  hstTimer clk;
  clk.tic();
  for(int i=0; i < count; i++)
    mmult<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
  double telapsed = clk.toc();
  cout.width(40);
  cout<<"matrix multiplication in global memory"<<endl;
  cout.width(30);
  cout<<"count = "<<count<<endl;
  cout.width(30);
  cout<<"dim of square matrices N = "<<N<<endl;
  cout.width(30);
  cout<<"time elapsed = "<<telapsed<<" milliseconds"<<endl;
  cout.width(30);
  cout<<"giga flops per second = "<<2.0*count*N*N*N/(telapsed*1e-3)/1e9<<endl;
  cout.width(30);
  cout<<"flops per cycle = "<<2.0*count*N*N*N/(telapsed*1e-3)/(CLKSPD*1e9)<<endl;
  cout<<endl;
  
  for(int i=0; i < count; i++)
    mmultsmem<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
  telapsed = clk.toc();
  cout.width(40);
  cout<<"matrix multiplication using shared memory"<<endl;
  cout.width(30);
  cout<<"count = "<<count<<endl;
  cout.width(30);
  cout<<"dim of square matrices N = "<<N<<endl;
  cout.width(30);
  cout<<"time elapsed = "<<telapsed<<" milliseconds"<<endl;
  cout.width(30);
  cout<<"giga flops per second = "<<2.0*count*N*N*N/(telapsed*1e-3)/1e9<<endl;
  cout.width(30);
  cout<<"flops per cycle = "<<2.0*count*N*N*N/(telapsed*1e-3)/(CLKSPD*1e9)<<endl;
  cout<<endl;
  
}

int main(){
  //testmmult();
  runmmult();
}
