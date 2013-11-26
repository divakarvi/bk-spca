#ifndef __BCAST26NOV2013__
#define __BCAST26NOV2013__
/*
 * process of rank 0 (root = 0) broadcasts its buffer 
 * returns number of cycles consumed
 */
double bcast(int rank, int nprocs, double *buffer, int bufsize);

/*
 * same as above but using Isend and Irecv
 */
double bcast_srecv(int rank, int nprocs, double *buffer, int bufsize);
#endif
