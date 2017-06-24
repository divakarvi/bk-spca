#ifndef CYCLE21NOV2013
#define CYCLE21NOV2013
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
	 * Copies recvbufl[] to sendbufr[].
	 * Copies recvbufr[] to sendbufl[].
	 */
	void copy_r2s();
};

#endif

