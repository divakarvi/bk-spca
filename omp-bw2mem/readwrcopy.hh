#ifndef __READWRCOPY21OCT2013__
#define __READWRCOPY21OCT2013__
/*
 * numa init of list using nthreads
 */
void init_manycore(double *list, long len, int nthreads);

/*
 * returns list[0] + .... + list[len-1]
 */
double sum_manycore(double *list, long len, int nthreads);


/*
 * list[first+i] = i by each thread
 * first = tid*len/nthreads
 */
void write_manycore(double *list, long len, int nthreads);

#endif
