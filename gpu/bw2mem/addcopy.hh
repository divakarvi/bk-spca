#ifndef addcopy26Sept2014
#define addcopy26Sept2014
#include "../utils/const.hh"

/*
 * Adds list[0..n-1].
 * Thread tid leaves its sum in result[tid].
 * n must be multiple of THinBLK*NBLKS for all entries to be added.
 * Divides list[] into blocks for every thread, very slow.
 */
__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void addblock(double *list, int n, double *result);

/*
 * Adds list[0..n-1].
 * Thread tid leaves its sum in result[tid].
 * n must be multiple of THinBLK*NBLKS for all entries to be added.
 * Used for measuring bw to memory.
 */
__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void addstride(double *list, int n, double *result);

/*
 * Copies list[0..n-1] to copy[0..n-1].
 * n must be multiple of THinBLK*NBLK for all entries to be copied.
 */
__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void copy(double *list, int n, double *copy);
#endif

