#include "../utils/TimeStamp.hh"
#include "../utils/utils.hh"
#include <iostream>
#include <fstream>
#include <iomanip>
#include <mpi.h>
#include <cstdlib>

void mpi_initialize(int& rank, int& nprocs){
	MPI_Init(NULL, NULL);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
}

//sendbuf and recvbuf must be of size numOFdoubles or more
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

void generate_output(){
	int rank;
	int nprocs;
	mpi_initialize(rank, nprocs);
	int MaxNumOFdoubles = 1000*100;//number of doubles
	double* sendbuf;
	double* recvbuf;
	sendbuf = new double[MaxNumOFdoubles];
	recvbuf = new double[MaxNumOFdoubles];
	TimeStamp clk; 
	srand(0);
	for(int i=0; i < MaxNumOFdoubles; i++)
		sendbuf[i] = 1.0*rand()/RAND_MAX*(rank+1);
	ofstream ofile("OUTPUT/unsafe1KTO100K.txt");
	for(int i=1; i <= 100; i++){
		if(rank==0)
			clk.tic();
		int numOFdoubles = i*100;
		unsafe(numOFdoubles, rank, nprocs, sendbuf, recvbuf);
		if(rank==0){
			double cycles = clk.toc();
			cout<<setw(25)<<"unsafe exchange of "
			    <<i<<" hundred doubles"<<endl;
			cout<<setw(25)<<"clock cycles = "<<cycles<<endl<<endl;
			ofile<<setw(25)<<"unsafe exchange of "
			     <<i<<" hundred doubles"<<endl;
			ofile<<setw(25)<<"clock cycles = "<<cycles<<endl<<endl;
		}
	}
	ofile.close();
	delete[] sendbuf;
	delete[] recvbuf;
	MPI_Finalize();
}

int main(){
	generate_output();
}
