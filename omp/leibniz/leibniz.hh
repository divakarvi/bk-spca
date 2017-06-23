#ifndef __ompliebniz16Oct2013__
#define __ompliebniz16Oct2013__
/*
 * Single thread function.
 * Returns partial sum of n terms of 4 * (1-1/3 + 1/5 - ...).
 */ 
double leibniz(long int n);

/*
 * Uses parallel regions to find partial sum above.
 * nthreads must be even.
 * (Because Leibniz has alt positive and neg terms.)
 * (Single thread gets terms of the same sign.)
 */
double parallel(long int n, int nthreads);

/*
 * Similar function to above, but implemented in a different style.
 */
double parallelX(long int n, int nthreads);

/*
 * omp for construct for leibniz partial sum.
 */
double ompfor(long int n);

/*
 * omp for. 
 * Static scheduling in chunks.
 */
double ompforchunk(long int n,  int chunk);

/*
 * Combines parallel and for into single construct.
 */
double parallelfor(long int n, int nthreads);

/*
 * section construct (one among many exotic constructs).
 */
double section(long int n);
#endif

