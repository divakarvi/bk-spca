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

#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "bcast.hh"
#include <mpi.h>

double bcast(int rank, int nprocs, double *buffer, int bufsize){
	TimeStamp clk;
	int root = 0;
	clk.tic();
	MPI_Bcast(buffer, bufsize, MPI_DOUBLE, root, MPI_COMM_WORLD);
	double cycles = clk.toc();
	return cycles;
}

double bcast_srecv(int rank, int nprocs, double *buffer, int bufsize){
	TimeStamp clk;
	int tag=0;
	
	clk.tic();
	if(rank==0){
		MPI_Request *reqlist=new MPI_Request[nprocs-1];
		for(int destn=1; destn<nprocs; destn++) 
			MPI_Isend(buffer, bufsize, MPI_DOUBLE,
				  destn, tag, MPI_COMM_WORLD, 
				  reqlist+destn-1);
		MPI_Waitall(nprocs-1,reqlist,MPI_STATUS_IGNORE);
	}
	else{
		MPI_Request req;
		MPI_Irecv(buffer, bufsize, MPI_DOUBLE,
			  0, tag, MPI_COMM_WORLD, &req);
		MPI_Wait(&req, MPI_STATUS_IGNORE);
	}
	double cycles = clk.toc();
	return cycles;
}
