#ifndef BCAST26NOV2013
#define BCAST26NOV2013
/*
 * Process of rank 0 (root = 0) broadcasts its buffer.
 * Returns number of cycles consumed.
 */
double bcast(int rank, int nprocs, double *buffer, int bufsize);

/*
 * Same as above but using Isend and Irecv.
 */
double bcast_srecv(int rank, int nprocs, double *buffer, int bufsize);
#endif

