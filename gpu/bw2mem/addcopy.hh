#ifndef __addcopy26Sept2014__
#define __addcopy26Sept2014__
#include "../utils/const.hh"

/*
 * adds list[0..n-1]
 * thread tid leaves its sum in result[tid]
 * n must be multiple of THinBLK*NBLKS for all entries to be added
 * divides list into blocks for every thread, very slow.
 */
__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void addblock(double *list, int n, double *result);

/*
 * adds list[0..n-1]
 * thread tid leaves its sum in result[tid]
 * n must be multiple of THinBLK*NBLKS for all entries to be added
 * used for measuring bw to memory
 */
__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void addstride(double *list, int n, double *result);

/*
 * copies list[0..n-1] to copy[0..n-1]
 * n must be multiple of THinBLK*NBLK for all entries to be copied
 */
__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void copy(double *list, int n, double *copy);
#endif

