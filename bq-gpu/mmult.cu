#include <iostream>
#include <cassert>
#include <cstdlib>
using namespace std;
#include <dvhstmem.hh>
#include <hstTimer.hh>
const int NUMTHREADS=1024;
const int NUMBLOCKS=14*14;
const int N=32*14;
const double CLKSPD=1.147;

__global__ void
__launch_bounds__(NUMTHREADS,1)
mmultgmem(double *A, double *B, double * C){
  int tid1024 = threadIdx.x;
  int ib = blockIdx.x%14;
  int jb = blockIdx.x/14;
  ib *= 32;
  jb *= 32;
  int i = ib + tid1024%32;
  int j = jb + tid1024/32;
  for(int k = 0; k < N; k++)
    C[i+j*N] += A[i+k*N]*B[k+j*N];
}

__global__ void
__launch_bounds__(NUMTHREADS,1)
mmultsmem(double *A, double *B, double * C){
  int tid1024 = threadIdx.x;
  __shared__ double smem[3*32*32];
  int ib = blockIdx.x%14;
  int jb = blockIdx.x/14;
  ib *= 32;
  jb *= 32;
  int ii = tid1024%32;
  int jj = tid1024/32;
  double *smemA = smem;
  double *smemB = smem+32*32;
  double *smemC = smem+2*32*32;
  smemC[ii+32*jj] = C[(ib+ii)+N*(jb+jj)];
  for(int kb = 0; kb < N; kb += 32){
    int kk = tid1024/32;
    smemA[ii+32*kk] = A[(ib+ii)+N*(kb+kk)]; 
    kk = tid1024%32;
    smemB[kk+32*jj] = B[(kb+kk)+N*(jb+jj)];
    __syncthreads();
    for(int kk=0; kk < 32; kk++)
      smemC[ii+32*jj] += smemA[ii+32*kk]*smemB[kk+32*jj];
  }
  C[(ib+ii)+N*(jb+jj)] = smemC[ii+32*jj];
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
  mmultgmem<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
  printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
  mmultgmem<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
  printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
  mmultgmem<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
  printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
  mC.device2host();
  cout<<"C[4] = "<<C[4]<<endl;
  cout<<"C[100004] = "<<C[100004]<<endl;
  for(int i=0; i < N*N; i++)
    if(C[i] != 3*448){
      cout<<"error at i = "<<i<<" C[i] = "<<C[i]<<endl;
      break;
    }
}

void runmmult(char flag){
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
  const int count = 1000;
  hstTimer clk;
  double telapsed;
  if(flag != 'g'){
    clk.tic();
    for(int i=0; i < count; i++)
      mmultsmem<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
    telapsed = clk.toc();
    cout.width(40);
    cout<<"matrix multiplication in shared memory"<<endl;
  }
  else{
    clk.tic();
    for(int i=0; i < count; i++)
      mmultgmem<<<NUMBLOCKS, NUMTHREADS>>>(dA, dB, dC);
    telapsed = clk.toc();
    cout.width(40);
    cout<<"matrix multiplication in global memory"<<endl;
  }
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
  testmmult();
  runmmult('s');
  runmmult('g');
}
