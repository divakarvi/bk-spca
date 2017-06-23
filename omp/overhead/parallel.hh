#ifndef parallel16Oct2013
#define parallel16Oct2013
#include "../../utils/StatVector.hh"

/*
 * nthreads: num of threads.
 * stats: returns StatVector object.
 * A single parallel region is entered.
 * The entire body of the parallel region is a single call to dummy().
 * The num of cycles of the parallel region is inserted into stats.
 */
void parallelA(int nthreads, StatVector& stats);

/*
 * Exactly the same as parallelA, but defined in another compilation unit.
 */
void parallelB(int nthreads, StatVector& stats);
#endif

