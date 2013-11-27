#include <iostream>
#include <fstream>
#include <iomanip>
#include <mpi.h>
#include <cstdlib>
#include <cassert>
#include "TimeStamp.hh"
using namespace std;

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
    MPI_Send(sendbuf, numOFdoubles, MPI_DOUBLE, nprocs-1, tag, MPI_COMM_WORLD);
    MPI_Recv(recvbuf, numOFdoubles, MPI_DOUBLE, nprocs-1, tag, MPI_COMM_WORLD,
	     &status);
  }
  else if(rank==nprocs-1){
    MPI_Send(sendbuf, numOFdoubles, MPI_DOUBLE, 0, tag, MPI_COMM_WORLD);
    MPI_Recv(recvbuf, numOFdoubles, MPI_DOUBLE, 0, tag, MPI_COMM_WORLD, &status);
  }
}

void generate_output(int argc, char** argv){
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
    int numOFdoubles = i*1000;
    unsafe(numOFdoubles, rank, nprocs, sendbuf, recvbuf);
    if(rank==0){
      double ticks = clk.toc();
      cout<<setw(25)<<"unsafe exchange of "<<i<<" thousand doubles"<<endl;
      cout<<setw(25)<<"clock cycles = "<<ticks<<endl<<endl;
      ofile<<setw(25)<<"unsafe exchange of "<<i<<" thousand doubles"<<endl;
      ofile<<setw(25)<<"clock cycles = "<<ticks<<endl<<endl;
    }
  }
  ofile.close();
  delete[] sendbuf;
  delete[] recvbuf;
  MPI_Finalize();
}

int main(int argc, char** argv){
  if(argc < 2){
    generate_output(argc, argv);
    return 0;
  }
  //stuff below goes into book
  int rank, nprocs;
  mpi_initialize(rank, nprocs);
  char fname[200];
  sprintf(fname, "outP%d.txt", rank);
  ofstream ofilePP;
  ofilePP.open(fname);
  int numOFdoubles = atoi(*++argv);//number of doubles
  double* sendbuf;
  double* recvbuf;
  sendbuf = new double[numOFdoubles];
  recvbuf = new double[numOFdoubles];
  srand(0);
  for(int i=0; i < numOFdoubles; i++)
    sendbuf[i] = 1.0*rand()/RAND_MAX/(rank+1.0);
  TimeStamp clk; 

  clk.tic();
  unsafe(numOFdoubles, rank, nprocs, sendbuf, recvbuf);
  double ticks = clk.toc();
  
  ofilePP<<"sendbuf on rank "<<rank<<": "<<sendbuf[0]<<" "<<sendbuf[1]<<" ..."<<endl;
  ofilePP<<"recvbuf on rank "<<rank<<": "<<recvbuf[0]<<" "<<recvbuf[1]<<" ..."<<endl;
  ofilePP<<"clock cycles = "<<ticks<<endl;
  ofilePP<<"numOFdoubles = "<<numOFdoubles<<endl;

  
  ofilePP.close();
  delete[] sendbuf;
  delete[] recvbuf;
  MPI_Finalize();
}
