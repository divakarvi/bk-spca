/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#ifndef __Transpose24NOV2013__
#define __Transpose24NOV2013__
#include <mpi.h>

extern int NTHREADS; /* initlzd using dv_omp_nthreads() in constructor */
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

/*
 * helper functions defined in trans.cpp
 * usedin trans.cpp as well as fast_trans.cpp
 */
void transposewlda(double *in, int lda, long nrows, long ncols, double *out);
void copywlda(double *in, int nrows, int ncols, double *out, int lda);
#endif
