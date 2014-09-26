#ifndef __leibniz25sept2014__
#define __leibniz25sept2014__
#include "../utils/const.hh"
/*
 * n = number of terms of Leibniz to be summed
 * result[] = array of dim THinBLK*NBLK
 * each thread returns its sum in result[tid]
 */
__global__ void 
__launch_bounds__(THinBLK, BLKinMP)
leibniz(long int n, double *result);

/*
 * n = number of terms of Leibniz
 * result[] = array of dim 1, result[0] must be 0 initially
 * lock[] = array of dim 1, lock[0] must be 0 initially
 * result[0] = sum at exit
 */
__global__ void 
__launch_bounds__(THinBLK, BLKinMP)
leibniztotal(long int n, double* result, int* lock);

/*
 * single precision version of leibniz()
 */
__global__ void 
__launch_bounds__(THinBLK, BLKinMP)
leibnizfloat(int n, float *result);

#endif 
