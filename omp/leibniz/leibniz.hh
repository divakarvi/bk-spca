#ifndef __ompliebniz16Oct2013__
#define __ompliebniz16Oct2013__
/*
 * single thread
 * returns partial sum of n terms of 4 * (1-1/3 + 1/5 - ...)
 */ 
double leibniz(long int n);

/*
 * uses parallel regions
 * nthreads must be even 
 * (because Leibniz has alt positive and neg terms)
 * (single thread gets terms of the same sign)
 */
double parallel(long int n, int nthreads);

/*
 * similar function to above, but implemented in a different style
 */
double parallelX(long int n, int nthreads);

/*
 * omp for construct for leibniz partial sum
 */
double ompfor(long int n);

/*
 * omp for 
 * static scheduling in chunks
 */
double ompforchunk(long int n,  int chunk);

/*
 * combine parallel and for into single construct
 */
double parallelfor(long int n, int nthreads);

/*
 * section construct (one among many exotic constructs)
 */
double section(long int n);
#endif
