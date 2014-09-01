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
#include "jacobi.hh"

void test_jacobi(int rank, int nprocs){
	int dim1 = 10;
	int dim2 =  36;
	int nth = 12;
	
	Jacobi2D jacobi(rank, nprocs, dim1, dim2, nth);
	jacobi.initializepp();
	for(int i=0; i < 1000; i++){
		jacobi.postsendrecv();
		jacobi.wait();
		jacobi.updatepp();
		jacobi.copypp();
	}

	verify_dir("DBG");
	char fname[200];
	sprintf(fname, "DBG/test_jacobi%d.txt", rank);
	link_cout(fname);

	array_show(jacobi.geta(), dim1*dim2, "interior points");

	unlink_cout();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	test_jacobi(rank, nprocs);
	mpi_finalize();
}
