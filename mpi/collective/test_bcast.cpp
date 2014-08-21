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
#include "../init/mpi_init.hh"
#include "bcast.hh"

/*
 * proc 0 broadcasts n doubles init from 0,.., n-1
 */
void test(int rank, int nprocs, int n){
	assrt(n > 0);
	double *buffer = new double[n];
	if(rank == 0)
		for(int i=0; i < n; i++)
			buffer[i] = i;
	else
		for(int i=0; i < n; i++)
			buffer[i] = -100;

	bcast(rank, nprocs, buffer, n);

	verify_dir("DBG");
	char fname[200];
	sprintf(fname, "DBG/test_bcast%d.txt", rank);
	link_cout(fname);
	
	array_show(buffer, n, "bcast data:");

	unlink_cout();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	
	test(rank, nprocs, 14);

	mpi_finalize();
}
