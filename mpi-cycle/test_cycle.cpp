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

#include "../utils/utils.hh"
#include "../mpi-init/mpi_init.hh"
#include "cycle.hh"

/*
 * left sendbuf -ve
 * right sendbuf +ve
 */
void init_sbuf(Cycle& cycle, int rank, int bufsize){
	double *buf = cycle.lsbuf();
	for(int i=0; i <  bufsize; i++)
		buf[i] = -(rank+1);
	
	buf = cycle.rsbuf();
	for(int i=0; i < bufsize; i++)
		buf[i] = (rank+1);
}

void test_cycle(int rank, int nprocs){
	char fname[200];
	if(rank == 0)
		verify_dir("DBG");
	MPI_Barrier(MPI_COMM_WORLD);
	sprintf(fname, "DBG/test_cycle_P%d.txt", rank);
	link_cout(fname);

	int bufsize = 10;
	Cycle cycle(rank, nprocs, bufsize);
	
	init_sbuf(cycle, rank, bufsize);
	double *buf = cycle.lsbuf();
	array_show(buf, bufsize, "init lsendbuf:");
	buf = cycle.rsbuf();
	array_show(buf, bufsize, "init rsendbuf:");
	for(int i=0; i < 100*nprocs+1; i++){
		cycle.post();
		cycle.wait();
		cycle.copy_r2s();
	}
	
	buf = cycle.lsbuf();
	array_show(buf, bufsize, "final lsendbuf:");
	buf = cycle.rsbuf();
	array_show(buf, bufsize, "final rsendbuf:");

	unlink_cout();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	
	test_cycle(rank, nprocs);
	
	mpi_finalize();
}
