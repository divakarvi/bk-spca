#include <iostream>
#include <fstream>
#include <mpi.h>
#include <cstdlib>
#include <cassert>
#include "StatVector.hh"
#include "TimeStamp.hh"
using namespace std;
const double NUMREPEATS=1e9;

void mpi_initialize(int& rank, int& nprocs){
  MPI_Init(NULL, NULL);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
}

double exchange_blocking(int rank, int nprocs, 
			 double* sendbuf, double* recvbuf, 
			 int bufsize){
  TimeStamp clk;
  int tag = 0;
  MPI_Status status;
  double cycles=0;
  if(rank==0){
    clk.tic();
    MPI_Send(sendbuf, bufsize, MPI_DOUBLE, nprocs-1, tag,
	     MPI_COMM_WORLD);
    MPI_Recv(recvbuf, bufsize, MPI_DOUBLE, nprocs-1, tag, 
	     MPI_COMM_WORLD,
	     &status);
    cycles = clk.toc();
  }
  else if(rank==nprocs-1){
    MPI_Recv(recvbuf, bufsize, MPI_DOUBLE, 0, tag, 
	     MPI_COMM_WORLD, &status);
    MPI_Send(sendbuf, bufsize, MPI_DOUBLE, 0, tag,
	     MPI_COMM_WORLD);
  }
  for(int i=0; i < bufsize; i++)
    sendbuf[i] = recvbuf[i];
  return cycles;
}

double exchange_nonblocking(int rank, int nprocs, 
			    double* sendbuf, double* recvbuf, 
			    int bufsize){
  TimeStamp clk;
  int tag = 0;
  MPI_Status status;
  double cycles=0;
  MPI_Request req1, req2;
  int destn = (rank==0)?nprocs-1:0;
  clk.tic();
  MPI_Isend(sendbuf, bufsize, MPI_DOUBLE, destn, tag, 
	    MPI_COMM_WORLD, &req1);
  MPI_Irecv(recvbuf, bufsize, MPI_DOUBLE, destn, tag, 
	    MPI_COMM_WORLD, &req2);
  MPI_Wait(&req1, &status); 
  MPI_Wait(&req2, &status);
  cycles = clk.toc();
 
  for(int i=0; i < bufsize; i++)
    sendbuf[i] = recvbuf[i];
  return cycles;
}

class Exchg{
private:
  double *sendbuf;
  double *recvbuf;
  int bufsize;
  MPI_Request req1;
  MPI_Request req2;
  TimeStamp clk;
public:
  Exchg(int rank, int nprocs, int bufsize);
  ~Exchg();
  void post();
  double wait();
  double& operator()(int i){return sendbuf[i];};
};


Exchg::Exchg(int rank, int nprocs, int bsize){
  bufsize = bsize;
  MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&sendbuf));
  MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&recvbuf));
  int tag = 0;
  if(rank==0){
    MPI_Send_init(sendbuf, bufsize, MPI_DOUBLE, nprocs-1, tag, 
		  MPI_COMM_WORLD, &req1);
    MPI_Recv_init(recvbuf, bufsize, MPI_DOUBLE, nprocs-1, tag, 
		  MPI_COMM_WORLD, &req2);
  }
  else if(rank==nprocs-1){
    MPI_Send_init(sendbuf, bufsize, MPI_DOUBLE, 0, tag, 
		  MPI_COMM_WORLD, &req1);
    MPI_Recv_init(recvbuf, bufsize, MPI_DOUBLE, 0, tag, 
		  MPI_COMM_WORLD, &req2);
  }
}

Exchg::~Exchg(){
  MPI_Free_mem(sendbuf);
  MPI_Free_mem(recvbuf);
  MPI_Request_free(&req1);
  MPI_Request_free(&req2);
}

void Exchg::post(){
  clk.tic();
  MPI_Start(&req1);
  MPI_Start(&req2);
}

double Exchg::wait(){
  MPI_Status status;
  MPI_Wait(&req1, &status);
  MPI_Wait(&req2, &status);
  double cycles = clk.toc();
  for(int i=0; i < bufsize; i++)
    sendbuf[i]=recvbuf[i];
  return cycles;
}

void time_nonblocking(int rank, int nprocs, int n, char *outputstring){
  int count = NUMREPEATS/n;
  StatVector stats(count);
  double* sendbuf;
  double* recvbuf;
  sendbuf = new double[n];
  recvbuf = new double[n];
  for(int i=0; i < n; i++)
    sendbuf[i] = rank;
  double cycles;
  for(int i=0; i < count; i++){
    cycles = exchange_nonblocking(rank, nprocs, sendbuf, recvbuf, n);
    stats.insert(cycles);
  }
  sprintf(outputstring,"%6.2e & %12.4g & %12.4g & %12.4g & %12.3g ",
	  (double)n, 
	  stats.min(), stats.median(), stats.max(), 16.0*n/stats.median());
}

void time_blocking(int rank, int nprocs, int n, char *outputstring){
  int count = NUMREPEATS/n;
  StatVector stats(count);
  double* sendbuf;
  double* recvbuf;
  sendbuf = new double[n];
  recvbuf = new double[n];
  for(int i=0; i < n; i++)
    sendbuf[i] = rank;
  double cycles;
  for(int i=0; i < count; i++){
    cycles = exchange_blocking(rank, nprocs, sendbuf, recvbuf, n);
    stats.insert(cycles);
  }
  sprintf(outputstring,"%6.2g & %12.4g & %12.4g & %12.4g & %12.3g ",
	  (double)n, 
	  stats.min(), stats.median(), stats.max(), 16.0*n/stats.median());
}


void time_persistent(int rank, int nprocs, int n, char *outputstring){
  int count = NUMREPEATS/n;
  StatVector stats(count);
  Exchg xchg(rank, nprocs, n);
  for(int i=0; i < n; i++)
    xchg(i) = (rank+1)*10;
  double cycles;
  for(int i=0; i < count; i++){
    xchg.post();
    cycles = xchg.wait();
    stats.insert(cycles);
  }
  sprintf(outputstring,"%6.2e & %12.4g & %12.4g & %12.4g & %12.3g ",
	  (double)n, 
	  stats.min(), stats.median(), stats.max(), 16.0*n/stats.median());
}

void CreateOutput(int rank, int nprocs){
  int nlist[7] = {100, 1000, 10000, 100000, 1000*1000, 1000*1000*10,
		 1000*1000*100};
  ofstream ofile_blk, ofile_nonblk, ofile_persist;
  char banner[200];
  sprintf(banner, 
  "     n            min         median            max            b/w(16.0*n/cycles)");
  if(rank==0){
    ofile_blk.open("OUTPUT/exchange_blocking.txt");
    ofile_blk<<"number of trials = "<<NUMREPEATS<<"/n"<<endl;
    ofile_blk<<banner<<endl;
    ofile_nonblk.open("OUTPUT/exchange_nonblocking.txt");
    ofile_nonblk<<"number of trials = "<<NUMREPEATS<<"/n"<<endl;
    ofile_nonblk<<banner<<endl;
    ofile_persist.open("OUTPUT/exchange_persistent.txt");
    ofile_persist<<"number of trials = "<<NUMREPEATS<<"/n"<<endl;
    ofile_persist<<banner<<endl;
  }
  char ostring[200];
  for(int i=0; i < 7; i++){
    time_blocking(rank, nprocs, nlist[i], ostring);
    if(rank==0)
      ofile_blk<<ostring<<endl;
    time_nonblocking(rank, nprocs, nlist[i], ostring);
    if(rank==0)
      ofile_nonblk<<ostring<<endl;
    time_persistent(rank, nprocs, nlist[i], ostring);
    if(rank==0)
      ofile_persist<<ostring<<endl;
  }
  if(rank==0){
    ofile_blk.close();
    ofile_nonblk.close();
    ofile_persist.close();
  }
}

int main(){
  int rank, nprocs;
  mpi_initialize(rank, nprocs);
  CreateOutput(rank, nprocs);
  MPI_Finalize();
}
