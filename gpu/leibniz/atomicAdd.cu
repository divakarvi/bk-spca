#include "atomicAdd.hh"
#include "../utils/const.hh"
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

