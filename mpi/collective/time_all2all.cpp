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
#include "../../utils/Table.hh"
#include "../../utils/StatVector.hh"
#include "../init/mpi_init.hh"
#include "all2all.hh"
#include <iostream>
#include <fstream>

const int NUMREPEATS = 5*100*1000*1000;

double time_scatter(int rank, int nprocs, int n, int flag){
	int count = NUMREPEATS/(n*nprocs);
	StatVector stats(count);
	double* sendbuf;
	double* recvbuf;
	sendbuf = new double[n*nprocs];
	recvbuf = new double[n*nprocs];
	int base = 10;
	while(base < nprocs)
		base *= 10;
	for(int dest = 0; dest < nprocs; dest++)
		for(int j=0; j < n; j++)
			sendbuf[n*dest+j] = rank*base+dest; 
	for(int i=0; i < count; i++){
		double cycles;
		if(flag==0)
			cycles = scatter_all2all(rank, nprocs, 
						 sendbuf, recvbuf, n);
		else
			cycles = mpi_all2all(rank, nprocs, sendbuf, recvbuf, n);
		stats.insert(cycles);
	}
	
	delete[] sendbuf;
	delete[] recvbuf;
	
	return stats.median();
}

double time_all2all(int rank, int nprocs, int n){
	int count = NUMREPEATS/(n*nprocs);
	StatVector stats(count);
	double* sendbuf;
	double* recvbuf;
	sendbuf = new double[n*nprocs];
	recvbuf = new double[n*nprocs];
	MPI_Request *reqlist;
	reqlist = all2all_init(rank, nprocs, sendbuf, recvbuf, n);
	
	int base = 10;
	while(base < nprocs)
		base *= 10;
	for(int dest = 0; dest < nprocs; dest++)
		for(int j=0; j < n; j++)
			sendbuf[n*dest+j] = rank*base+dest; 
	for(int i=0; i < count; i++){
		double cycles;
		cycles = all2all(rank, nprocs, reqlist);
		stats.insert(cycles);
	}
  	
	all2all_finalize(reqlist);
	return stats.median();
}

void time_all2all(int rank, int nprocs){
	char ostring[200];
	std::ofstream ofile;
	if(rank==0){
		ofile.open("OUTPUT/all2all.txt", std::ios::app);
		long int posn = ofile.tellp();
		if(posn<=0){
			ofile<<"num of trials = "
			     <<NUMREPEATS<<"/(n*nprocs)"<<std::endl;
			sprintf(ostring,"nprocs    &     "
				"n      &      b/w(scatter)    "
				"&     b/w(isend)");
			ofile<<ostring<<std::endl;
		}
	}
	int nlist[2] = {1000*100, 1000*1000};
	for(int i=0; i < 2; i++){
		int n = nlist[i];
		double cycles =  time_scatter(rank, nprocs, n, 0);
		double bw_scatter = 16.0*n*nprocs/cycles;
		cycles = time_all2all(rank, nprocs, n);
		double bw_isend = 16.0*n*nprocs/cycles;//persistent send
		cycles =  time_scatter(rank, nprocs, n, 1);
		double bw_mpia2a = 16.0*n*nprocs/cycles;
		sprintf(ostring, "%6d & %12.2g & %12.3g & %12.3g & %12.3g", 
			nprocs, (double)n, bw_scatter, bw_isend, bw_mpia2a);
		if(rank == 0)
			ofile<<ostring<<std::endl;
  }
	if(rank==0)
		ofile.close();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);

	time_all2all(rank, nprocs);

	mpi_finalize();
}
