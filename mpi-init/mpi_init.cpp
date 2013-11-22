#include "mpi_init.hh"
#include <mpi.h>

enum gl_mpi_onoff_enum gl_mpi_onoff = MPIOFF;

void mpi_initialize(int& rank, int& nprocs){
	MPI_Init(NULL, NULL);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
	gl_mpi_onoff = MPION;
}

void mpi_finalize(){
	MPI_Finalize();
	gl_mpi_onoff = MPIOFF;
}
