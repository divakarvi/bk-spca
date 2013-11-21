#include "mpi_utils.hh"
#include <mpi.h>

void mpi_initialize(int& rank, int& nprocs){
	MPI_Init(NULL, NULL);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
}
