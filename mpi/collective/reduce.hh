#ifndef __reduce26NOV2013__
#define __reduce26NOV2013__

double reducemin(int rank, int nprocs, 
		 double *sendbuf, double *recvbuf, int bufsize);

double reducemin_tree(int rank, int nprocs,
		      double *sendbuf, double *recvbuf, 
		      double *scratch, int bufsize);

#endif

