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
#include "../init/mpi_init.hh"
#include "jacobi.hh"
#include <fstream>

double time_jacobi(int rank, int nprocs, 
		   int dim1, int dim2,
		   int nitns){
	int nth = dv_omp_nthreads();
	
	Jacobi2D jacobi(rank, nprocs, dim1, dim2, nth);
	jacobi.initializepp();
	
	TimeStamp clk;
	clk.tic();
	for(int i=0; i < nitns; i++){
		jacobi.postsendrecv();
		jacobi.wait();
		jacobi.updatepp();
		jacobi.copypp();
	}
	return clk.toc();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	mpi_print_name(rank);


	int dim1 = 100*1000;
	int dim2 = 10*1000;
	int nitns = 100;

	double cycles = time_jacobi(rank, nprocs, dim1, dim2, nitns);

	cycles = cycles/(1.0*dim1*(dim2+2))/(1.0*nitns);
	
	if(rank == 0){
		verify_dir("output");
		char fname[200];
		sprintf(fname, "output/time_jacobi_NP%d.txt", nprocs);
		std::ofstream ofile(fname, std::ios::app);
		
		ofile<<"             dim1 = "<<dim1<<std::endl;
		ofile<<"             dim2 = "<<dim2<<std::endl;
		ofile<<"            nitns = "<<nitns<<std::endl;
		ofile<<" cycles/entry/itn = "<<cycles<<std::endl<<std::endl;
	}

	mpi_finalize();
}
