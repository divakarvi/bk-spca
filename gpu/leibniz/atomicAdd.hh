#ifndef atomicAdd25Sept2014
#define atomicAdd25Sept2014
/*
 * Adds value to result[0], with mutual exclusion between threads.
 * Deadlocks.
 */
__device__ void atomicAddDoubleDeadLock(double value, 
					volatile double *result, 
					volatile int *lock);
/*
 * Adds value to result[0], with mutual exclusion between threads.
 * Does not deadlock.
 */
__device__ void atomicAddDouble(double value, 
				volatile double *result, volatile int *lock);
#endif

