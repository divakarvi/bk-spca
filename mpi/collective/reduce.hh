#ifndef reduce26NOV2013
#define reduce26NOV2013

/*
 * sendbuf[]: On each proc, an array of data.
 * recvbuf[]: returns min of sendbuf[] of all procs on each proc.
 *   bufsize: size of bufs above.
 */
double reducemin(int rank, int nprocs, 
		 double *sendbuf, double *recvbuf, int bufsize);

/*
 * Same as above, but implemented using a tree and send/recv.
 */
double reducemin_tree(int rank, int nprocs,
		      double *sendbuf, double *recvbuf, 
		      double *scratch, int bufsize);

#endif

