#ifndef __CYCLE21NOV2013__
#define __CYCLE21NOV2013__
#include <mpi.h>

class Cycle{
private:
	double *sendbufl, *sendbufr;
	double *recvbufl, *recvbufr;
	int bufsize;
	MPI_Request reqlist[4];
	/*
	 * sreq1, sreq2, rreq1, rreq2 are references to entries of
	 * reqlist[]
	 */
	MPI_Request &sreq1;
	MPI_Request &sreq2;
	MPI_Request &rreq1;
	MPI_Request &rreq2;
public:
	Cycle(int rank, int nprocs, int bufsize);
	~Cycle();
	void post();
	void wait();
	double* lsbuf(){return sendbufl;};
	double* rsbuf(){return sendbufr;};
	double* lrbuf(){return recvbufl;};
	double* rrbuf(){return recvbufr;};
	/*
	 * copy recvbufl[] to sendbufr[]
	 * copy recvbufr[] to sendbufl[]
	 */
	void copy_r2s();
};

#endif
