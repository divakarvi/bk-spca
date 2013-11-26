#ifndef __TransposePipeline24NOV2013__
#define __TransposePipeline24NOV2013__
#include <mpi.h>

class FastTrans{
private:
	int p; //process rank
	int P; //number of processes
	long  M;
	long  N;
	long *fstM;
	long *fstN;
	double *sendbuf, *recvbuf;
	MPI_Request *sreqlist, *rreqlist;
	int *sendorder;
	int *rcvd_list;
public:
	FastTrans(int rank, int nprocs, long Mi, long Ni);
	~FastTrans();
	long ffstM(int rank){return fstM[rank];};
	long ffstN(int rank){return fstN[rank];};
	void copyTOsendbuf(int q, double *localMN);
	void postsend(int q);
	void postrecv(int q);
	void wait(); /* wait on all sends */
	void copyFROMrecvbuf(int q, double *localNM);
	void transpose(double *localMN, double *localNM);
};

#endif
