#ifndef overhead16Oct2013
#define overhead16Oct2013

/*
 * nthreads: num of threads.
 * count: for loop count, barrier inside for loop.
 * Returns overhead of single barrier in cycles.
 */
double barrier_overhead(int nthreads, long int count);

/*
 * nthreads: num of threads.
 * countinner: num of itns of omp for loop (body is a single call to dummy())
 * countouter: num of omp for loops timed.
 * Compares to cpp and returns overhead of single omp for in cycles.
 */
double ompfor_overhead(int nthreads, int countinner, long int countouter);

/*
 * Same as above, but with nowait for construct
 */
double ompfornowait_overhead(int nthreads, long int countinner, 
			     long int countouter);

/*
 * Uses schedule(dynamic).
 */
double ompfordynamic_overhead(int nthreads, long int countinner, 
			      long int countouter);
#endif

