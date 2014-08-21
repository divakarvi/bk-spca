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
