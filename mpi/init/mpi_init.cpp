#include "../../utils/utils.hh"
#include "mpi_init.hh"
#include <mpi.h>
#include <cstdio>

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

void BlockDivide(long n, int P, long *fst){
	long  Q = n/P;
	long  R = n-Q*P;
	fst[0] = 0;
	for(int p=0; p < R; p++)
		fst[p+1] = fst[p] + (Q+1);
	for(int p=R; p < P; p++)
		fst[p+1] = fst[p]+Q;
}


void mpi_print_name(int rank){
	char procname[200];
	int procnamelen;
	MPI_Get_processor_name(procname, &procnamelen);
	std::cout<<"proc name = "<<procname<<" rank = "<<rank<<std::endl;
	MPI_Barrier(MPI_COMM_WORLD);
}
