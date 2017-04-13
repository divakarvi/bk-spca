#ifndef __atomicAdd25Sept2014__
#define __atomicAdd25Sept2014__
/*
 * adds value to result[0], with mutual exclusion between thread
 * deadlocks
 */
__device__ void atomicAddDoubleDeadLock(double value, 
					volatile double *result, 
					volatile int *lock);
/*
 * adds value to result[0], with mutual exclusion between threads
 * does not deadlock
 */
__device__ void atomicAddDouble(double value, 
				volatile double *result, volatile int *lock);
#endif

