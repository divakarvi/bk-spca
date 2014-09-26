#include "../utils/const.hh"
#include "atomicAdd.hh"
#include "leibniz.hh"


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