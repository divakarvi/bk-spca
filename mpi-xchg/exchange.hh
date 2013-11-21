#ifndef __EXCHANGE21NOV2013__
#define __EXCHANGE21NOV2013__
#include <mpi.h>

/*
 * sendbuf[0..n)
 * recvbuf[0..n)
 * rank 0 sends to nprocs-1 and then receives
 * rank nprocs-1 recvs from 0 and then sends
 */
void exchange_blocking(int rank, int nprocs, 
			 double* sendbuf, double* recvbuf, int n);

/*
 * same as above but use MPI_Isend/Irecv in place of MPI_Send/Recv
 */
void exchange_nonblocking(int rank, int nprocs, 
			    double* sendbuf, double* recvbuf, int n);

/*
 * persistent exchange of information between 0 and nprocs-1
 */
class Exchg{
private:
	double *sendbuf;
	double *recvbuf;
	int bufsize;
	MPI_Request req1;
	MPI_Request req2;
public:
	Exchg(int rank, int nprocs, int bufsize);
	~Exchg();
	void post();
	void wait();
	int getbufsize(){return bufsize;}
	double *getsbuf(){return sendbuf;}
	double *getrbuf(){return recvbuf;}
};

#endif
