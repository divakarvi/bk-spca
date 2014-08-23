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

#include "../../utils/TimeStamp.hh"
#include "../init/mpi_init.hh"
#include "lustre.hh"
#include <mpi.h>
#include <cstdio>
#include <cstdlib>
#include <iostream>

/*
 * more testing in time_lustre.cpp
 */
double test_write(long count){
	int rank;
	int nprocs;
	mpi_initialize(rank, nprocs);
	char *s = new char[count];
	for(long i=0; i < count; i++)
		s[i] = (i%2==0)?'a'+rank:'\n';
	char fname[200];
	sprintf(fname, "%s/parallel.dat", getenv("SCRATCH"));
	if(rank==0){
		char cmd[200];
		sprintf(cmd, "rm %s", fname);
		system(cmd);
		//sprintf(cmd, "touch %s", fname);
		//system(cmd);
		sprintf(cmd, "lfs setstripe --count 20 %s", fname);
		system(cmd);
	}
	MPI_Barrier(MPI_COMM_WORLD);
	TimeStamp clk;
	clk.tic();
	write_mpi((void *)s, count, fname, rank*count);
	double cycles = clk.toc();
	if(rank==0){
		std::cout<<"write b/w = "
			 <<count*1.0/cycles
			 <<" bytes/cycle"
			 <<std::endl;
		char cmd[200];
		sprintf(cmd, "ls -l %s", getenv("SCRATCH"));
		system(cmd);
	}
	mpi_finalize();
	delete[] s;
	return cycles;
}

int main(){
	test_write(1000l*1000*1000*20);
}
