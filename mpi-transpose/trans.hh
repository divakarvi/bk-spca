#ifndef __Transpose24NOV2013__
#define __Transpose24NOV2013__
#include <mpi.h>

const int NTHREADS = 12;

class Transpose{
private:
	int p; //process rank
	int P; //number of processes
	long  M;
	long  N;
	long *fstM;
	long *fstN;
	double *sendbuf, *recvbuf;
	MPI_Request *sreqlist, *rreqlist;
	
public:
	Transpose(int rank, int nprocs, long Mi, long Ni);
	~Transpose();
	long ffstM(int rank){return fstM[rank];};
	long ffstN(int rank){return fstN[rank];};
	void copyTOsendbuf(double *localMN);
	void postsend();
	void postrecv();
	void wait();
	void copyFROMrecvbuf(double *localNM);
	void transpose(double *localMN, double *localNM);
};

struct trans_timer_struct {
	double scopy;
	double mpi;
	double rcopy;
};
/*
 * struct to save cycles used by send copy, mpi, recv copy
 */
extern struct trans_timer_struct trans_timer;
/*
 * zeros all entries of trans_cycles
 */
void zero_trans_timer();

#endif
