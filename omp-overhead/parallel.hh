#ifndef __parallel16Oct2013__
#define __parallel16Oct2013__
#include "../utils/StatVector.hh"

/*
 * nthreads = num of threads
 * stats = StatVector object
 * a single parallel region is entered
 * the entire body of the parallel region is a single call to dummy()
 * the num of cycles of the parallel region is inserted into stats
 */
void parallelA(int nthreads, StatVector& stats);

/*
 * exactly the same as parallelA, but defined in another compilation unit
 */
void parallelB(int nthreads, StatVector& stats);
#endif
