#include "../../utils/TimeStamp.hh"
#include "../../utils/utils.hh"
#include "../init/mpi_init.hh"
#include <mpi.h>
#include <iostream>
#include <fstream>
#include <cstdlib>

/*
 * sendbuf[]: double array of numOfdoubles 
 * recvbuf[]: double array of numOfdoubles
 * rank 0 sends to nprocs-1 and then receives
 * rank nprocs-1 sends to 0 and then receives
 */
void unsafe(int numOFdoubles, int rank, int nprocs,
	    double *sendbuf, double *recvbuf)
{
	int tag = 0;
	MPI_Status status;
	MPI_Barrier(MPI_COMM_WORLD);
	if(rank==0){
		MPI_Send(sendbuf, numOFdoubles, MPI_DOUBLE, 
			 nprocs-1, tag, MPI_COMM_WORLD);
		MPI_Recv(recvbuf, numOFdoubles, MPI_DOUBLE, 
			 nprocs-1, tag, MPI_COMM_WORLD, &status);
	}
	else if(rank==nprocs-1){
		MPI_Send(sendbuf, numOFdoubles, MPI_DOUBLE, 
			 0, tag, MPI_COMM_WORLD);
		MPI_Recv(recvbuf, numOFdoubles, MPI_DOUBLE, 
			 0, tag, MPI_COMM_WORLD, &status);
	}
}

/*
 * Returns num of cycles to send and recv n doubles.
 */
double time_unsafe(int rank, int nprocs, int n){
	double* sendbuf;
	double* recvbuf;
	sendbuf = new double[n];
	recvbuf = new double[n];
	srand(0);
	for(int i=0; i < n; i++)
		sendbuf[i] = 1.0*rand()/RAND_MAX*(rank+1);
	
	TimeStamp clk; 
	clk.tic();
	unsafe(n, rank, nprocs, sendbuf, recvbuf);
	double cycles = clk.toc();
	
	delete[] sendbuf;
	delete[] recvbuf;

	return cycles;
}

void generate_output(int rank, int nprocs){
	std::ofstream ofile;
	if(rank == 0){
		verify_dir("DBG");
		ofile.open("DBG/unsafe1KTO100K.txt");
	}

	for(int i=1; i <= 100; i++){
		int n = i*1000/8; //num of doubles.
		double cycles = time_unsafe(rank, nprocs, n);
		if(rank == 0){
			ofile<<"number of bytes xchgd: "<<n*8<<std::endl;
			ofile<<"               cycles: "<<cycles
			     <<std::endl<<std::endl;
		}
	}
	
	if(rank == 0)
		ofile.close();
}

int main(){
	int rank;
	int nprocs;
	mpi_initialize(rank, nprocs);

	generate_output(rank, nprocs);

	mpi_finalize();
}

