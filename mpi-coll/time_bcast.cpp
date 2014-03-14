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
#include "../utils/Table.hh"
#include "../utils/StatVector.hh"
#include "../mpi-init/mpi_init.hh"
#include "bcast.hh"

enum bcast_flag_enum {BCAST_MPI, BCAST_SR};

double time_bcast(int rank, int nprocs, int n, enum bcast_flag_enum flag){
	int count = 500;
	StatVector stats(count);
	double *buffer;
	buffer = new double[n];

	if(rank==0)
		for(int i=0; i < n; i++)
			buffer[i] = 28;

	for(int i=0; i < count; i++){
		double cycles;
		switch(flag){
		case BCAST_MPI:
			cycles = bcast(rank, nprocs, buffer, n);
			break;
		case BCAST_SR:
			cycles = bcast_srecv(rank, nprocs, buffer, n);
			break;
		}
		stats.insert(cycles);
	}

	delete[] buffer;
	
	return stats.median();
}

/*
 * table comes out looking too heavy, but leave this as it is
 */
void make_table(int rank, int nprocs, 
		const char* banner, enum bcast_flag_enum flag){
	const char* rows[4] = {"1", "1e2", "1e5", "1e6"};
	int nlist[4] = {1, 100, 1000*100, 1000*1000};
	const char* cols[3] = {"nprocs", "bw", "cycles"};
	double data[12];

	verify_dir("OUTPUT");
	link_cout("OUTPUT/bcast.txt", LC_APP);
		
	for(int  i=0; i < 4; i++){
		int n = nlist[i];
		double cycles = time_bcast(rank, nprocs, n,flag);
		double bw = 8.0*n/cycles;
		data[i] = nprocs;
		data[i+4] = bw;
		data[i+8] = cycles;
	}
	
	if(rank == 0){
		Table tbl;
		tbl.dim(4, 3);
		tbl.rows(rows);
		tbl.cols(cols);
		tbl.data(data);
		tbl.print(banner);
	}
	unlink_cout();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);

	make_table(rank, nprocs, "mpi bcast", BCAST_MPI);
	make_table(rank, nprocs, "send/recv bcast", BCAST_SR);

	mpi_finalize();
}
