#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../mpi-init/mpi_init.hh"
#include "jacobi.hh"
#include <fstream>

double time_jacobi(int rank, int nprocs, 
		   int dim1, int dim2,
		   int nitns){
	int nth = 12;
	
	Jacobi2D jacobi(rank, nprocs, dim1, dim2, nth);
	jacobi.initializepp();
	
	TimeStamp clk;
	clk.tic();
	for(int i=0; i < nitns; i++){
		jacobi.postsendrecv();
		jacobi.updateinteriorpp();
		jacobi.wait();
		jacobi.updateboundary();
		jacobi.copypp();
	}
	return clk.toc();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	
	int dim1 = 100*1000;
	int dim2 = 10*1000;
	int nitns = 1000;

	double cycles = time_jacobi(rank, nprocs, dim1, dim2, nitns);

	cycles = cycles/(1.0*dim1*(dim2+2))/(1.0*nitns);
	
	if(rank == 0){
		verify_dir("DBG");
		char fname[200];
		sprintf(fname, "DBG/time_jacobi_NP%d.txt", nprocs);
		std::ofstream ofile(fname, std::ios::app);
		
		ofile<<"             dim1 = "<<dim1<<std::endl;
		ofile<<"             dim2 = "<<dim2<<std::endl;
		ofile<<"            nitns = "<<nitns<<std::endl;
		ofile<<" cycles/entry/itn = "<<cycles<<std::endl<<std::endl;
	}

	mpi_finalize();
}
