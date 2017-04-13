#ifndef __CYCLE21NOV2013__
#define __CYCLE21NOV2013__
#include <mpi.h>

class Cycle{
private:
	double *sendbufl;
	double *sendbufr;
	double *recvbufl, *recvbufr;
	int bufsize;
	MPI_Request reqlist[4];
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

