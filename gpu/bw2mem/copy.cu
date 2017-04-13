#include "addcopy.hh"

__global__
__launch_bounds__(THinBLK, BLKinMP)
void copy(double *list, int n, double *copy){
	int tid = threadIdx.x + blockIdx.x*blockDim.x;
	int stride = blockDim.x*gridDim.x;
	for(int i=tid; i < n; i = i + stride)
		copy[i] = list[i]; 
}

