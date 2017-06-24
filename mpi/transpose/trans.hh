#ifndef Transpose24NOV2013
#define Transpose24NOV2013
#include <mpi.h>

extern int NTHREADS; //Initlzd using dv_omp_nthreads() in constructor.
class Transpose{
private:
	int p; //Process rank.
	int P; //Number of processes.
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

/*
 * Helper functions defined in trans.cpp.
 * Used in trans.cpp as well as fast_trans.cpp.
 */
void transposewlda(double *in, int lda, long nrows, long ncols, double *out);
void copywlda(double *in, int nrows, int ncols, double *out, int lda);
#endif

