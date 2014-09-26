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

#include "../utils/dhstmem.hh"
#include "../utils/hstTimer.hh"
#include "../utils/const.hh"
#include <iostream>
#include <cassert>
#include <cstdlib>


__global__ void 
__launch_bounds__(THinBLK, BLKinMP)
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
__device__ void atomicAddDoubleDeadLock(double value, 
					volatile double *result, 
					volatile int *lock){
	int lockcopy=1;
	while(lockcopy==1)
		lockcopy = atomicExch((int *)lock, 1);
	*result += value;
	atomicExch((int *)lock, 0);
}


//result and lock must be pointers to global memory 
//*result and *lock must be initialized to zero
__device__ void atomicAddDouble(double value, 
				volatile double *result, volatile int *lock){
	for(int i=0; i < NWARP; i++){
		if(threadIdx.x%NWARP==i){
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
__launch_bounds__(THinBLK, BLKinMP)
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
__launch_bounds__(THinBLK, BLKinMP)
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

void run_leibniz(long int n){
	int NBLK = NMP*BLKinMP;
		
	double *dresult, *result;
	dhstmem<double> dhmem(THinBLK*NBLK);
	dresult = dhmem.device();
	result = dhmem.host();
	
	std::cout.width(40);
	std::cout<<std::endl<<"Leibniz partially"<<std::endl;
	
	hstTimer nvclk;
	nvclk.tic();  
	leibniz<<<NBLK, THinBLK>>>(n, dresult);
#ifdef DEBUG
	printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
	double telapsed = nvclk.toc(); 
	dhmem.device2host();
	double ans=0;
	for(int i=0; i < NBLK*THinBLK; i++)
		ans += result[i];
	std::cout.width(30);
	std::cout<<"leibniz partial sum = "<<ans<<std::endl;
	std::cout.width(30);
	std::cout<<"THinBLK = "<<THinBLK<<std::endl;
	std::cout.width(30);
	std::cout<<"NBLK = "<<NBLK<<std::endl;
	std::cout.width(30);
	std::cout<<"Time elapsed = "<<telapsed<<" milliseconds"<<std::endl<<std::endl;
}

void run_leibniztotal(long int n){
	int NBLK = NMP*BLKinMP;
	
	double *dresult, *result;
	dhstmem<double> dhmem(1);
	dresult = dhmem.device();
	result = dhmem.host();
	*result = 0;
	dhmem.host2device();
	
	dhstmem<int> dhmemi(1);
	int *dlock = dhmemi.device();
	int *hlock = dhmemi.host();
	*hlock = 0;
	dhmemi.host2device();

	std::cout.width(40);
	std::cout<<std::endl<<"Leibniz in total"<<std::endl;

	hstTimer nvclk;
	nvclk.tic();  
	leibniztotal<<<NBLK,THinBLK>>>(n, dresult, dlock);
#ifdef DEBUG
	printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
	std::cout.width(30);
	std::cout<<"Time elapsed = "<<nvclk.toc()<<" milliseconds"<<std::endl;
	dhmem.device2host();
	std::cout.width(30);
	std::cout<<"leibniz partial sum = "<<*result<<std::endl;
	std::cout.width(30);
	std::cout<<"THinBLK = "<<THinBLK<<std::endl;
	std::cout.width(30);
	std::cout<<"NBLK = "<<NBLK<<std::endl<<std::endl;
}

void run_leibnizfloat(int n){
	int NBLK = NMP*BLKinMP;
	
	float *dresult, *result;
	dhstmem<float> dhmem(THinBLK*NBLK);
	dresult = dhmem.device();
	result = dhmem.host();


	std::cout.width(40);
	std::cout<<"Leibniz in single precision"<<std::endl;

	hstTimer nvclk;
	nvclk.tic();  
	leibnizfloat<<<NBLK, THinBLK>>>(n, dresult);
#ifdef DEBUG
	printf("CUDA: %s\n", cudaGetErrorString(cudaGetLastError()));
#endif
	double telapsed = nvclk.toc(); 


	dhmem.device2host();
	float ans=0;
	for(int i=0; i < NBLK*THinBLK; i++)
		ans += result[i];

	std::cout.width(30);
	std::cout<<"leibniz partial sum = "<<ans<<std::endl;
	std::cout.width(30);
	std::cout<<"THinBLK = "<<THinBLK<<std::endl;
	std::cout.width(30);
	std::cout<<"NBLK = "<<NBLK<<std::endl;
	std::cout.width(30);
	std::cout<<"Time elapsed = "<<telapsed<<" milliseconds"
		 <<std::endl<<std::endl;
}

void run_all(long n){
	run_leibniz(n);
	run_leibniztotal(n);
	run_leibnizfloat(n);
}

int main(){
	long int n = 1000l*1000*1000*10;
	run_all(n);
}
