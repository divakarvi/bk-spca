#include <mpi.h>
#include <iostream>

int main(int argc, char **argv){
	MPI_Init(NULL, NULL);
	int nprocs, rank;
	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	char procname[200];
	int procnamelen;
	MPI_Get_processor_name(procname, &procnamelen);
	
	std::cout<<"proc name = "<<procname<<" rank = "<<rank<<std::endl;

	MPI_Finalize();
}
