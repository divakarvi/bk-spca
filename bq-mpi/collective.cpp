#include <iostream>
#include <fstream>
#include <mpi.h>
#include <cstdlib>
#include <cassert>
#include "TimeStamp.hh"
#include "StatVector.hh"
using namespace std;

const double NUMREPEATS=5e8;

void mpi_initialize(int& rank, int& nprocs){
  MPI_Init(NULL, NULL);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
}

double bcast(int rank, int nprocs, double *buffer, int bufsize){
  TimeStamp clk;
  int root = 0;
  clk.tic();
  MPI_Bcast(buffer, bufsize, MPI_DOUBLE, root, MPI_COMM_WORLD);
  double cycles = clk.toc();
  return cycles;
}


double time_bcast(int rank, int nprocs, int n){
  int count = NUMREPEATS/n;
  StatVector stats(count);
  double *buffer;
  buffer = new double[n];
  if(rank==0)
    for(int i=0; i < n; i++)
      buffer[i] = 28;
  for(int i=0; i < count; i++){
    double cycles = bcast(rank, nprocs, buffer, n);
    stats.insert(cycles);
  }
  for(int i=0; i < nprocs; i++){//limited check
    if(rank==i)
      cout<<buffer[0]<<" "<<buffer[n-1]<<endl;
    MPI_Barrier(MPI_COMM_WORLD);
  }
  delete[] buffer;
  return stats.median();
}


void CreateOutputBcast(int rank, int nprocs){
  char ostring[200];
  ofstream ofile;
  if(rank==0){
    ofile.open("OUTPUT/bcast.txt", ios_base::app);
    long int posn = ofile.tellp();
    if(posn<=0){
      ofile<<"num of trials = "<<NUMREPEATS<<"/bufsize"<<endl;
      sprintf(ostring,"nprocs    &     bufsize      &      b/w");
      ofile<<ostring<<endl;
    }
  }
  int nlist[3] = {1000*100, 1000*1000, 1000*1000*100};
  for(int  i=0; i < 3; i++){
    int n = nlist[i];
    double cycles = time_bcast(rank, nprocs, n);
    double bwidth = 8.0*n/cycles;
    sprintf(ostring, "%6d & %12.2g & %12.3g", nprocs, (double)n, bwidth);
    if(rank == 0)
      ofile<<ostring<<endl;
  }  
  if(rank==0)
    ofile.close();
}

double scatter_all2all(int rank, int nprocs, 
		       double *sendbuf, double *recvbuf, int n){
  TimeStamp clk;
  clk.tic();
  for(int root=0; root < nprocs; root++)
    MPI_Scatter(sendbuf, n, MPI_DOUBLE, recvbuf+n*root,n,MPI_DOUBLE, 
		root,MPI_COMM_WORLD);
  double cycles = clk.toc();
  return cycles;
}

double isend_all2all(int rank, int nprocs, 
		     double *sendbuf, double *recvbuf, int n,
		     MPI_Request* sreqlist, MPI_Request* rreqlist){
  TimeStamp clk;
  clk.tic();
  for(int i=0; i < nprocs; i++) {
    int dest = i;
    int tag = rank;
    MPI_Isend(sendbuf+dest*n, n, MPI_DOUBLE, dest, tag, 
	      MPI_COMM_WORLD, sreqlist+i);
  }
  for(int i=0; i < nprocs; i++){
    int source = i;
    int tag = source;
    MPI_Irecv(recvbuf+source*n, n, MPI_DOUBLE, source, tag, 
	      MPI_COMM_WORLD, rreqlist+i);
  }
  for(int i=0; i < nprocs; i++){
    MPI_Status status;
    MPI_Wait(sreqlist+i, &status);
    MPI_Wait(rreqlist+i, &status);
  }
  double cycles = clk.toc();
  return cycles;
}

double time_scatter(int rank, int nprocs, int n){
  int count = NUMREPEATS/(n*nprocs);
  StatVector stats(count);
  double* sendbuf;
  double* recvbuf;
  sendbuf = new double[n*nprocs];
  recvbuf = new double[n*nprocs];
  int base = 10;
  while(base < nprocs)
    base *= 10;
  for(int dest = 0; dest < nprocs; dest++)
    for(int j=0; j < n; j++)
      sendbuf[n*dest+j] = rank*base+dest; 
  for(int i=0; i < count; i++){
    double cycles;
    cycles = scatter_all2all(rank, nprocs, sendbuf, recvbuf, n);
    stats.insert(cycles);
  }
  
  //basic check (cout used in an unsafe manner)
  for(int i=0; i < nprocs; i++){
    if(rank == i){
      for(int j=0; j < nprocs; j++)
	cout<<recvbuf[n*j]<<" ";
      cout <<endl<<endl;
    }
    MPI_Barrier(MPI_COMM_WORLD);
  }
  
  delete[] sendbuf;
  delete[] recvbuf;

  return stats.median();
}

double time_isend(int rank, int nprocs, int n){
  int count = NUMREPEATS/(n*nprocs);
  StatVector stats(count);
  double* sendbuf;
  double* recvbuf;
  sendbuf = new double[n*nprocs];
  recvbuf = new double[n*nprocs];
  MPI_Request *sreqlist, *rreqlist;
  sreqlist = new MPI_Request[nprocs];
  rreqlist = new MPI_Request[nprocs];
  int base = 10;
  while(base < nprocs)
    base *= 10;
  for(int dest = 0; dest < nprocs; dest++)
    for(int j=0; j < n; j++)
      sendbuf[n*dest+j] = rank*base+dest; 
  for(int i=0; i < count; i++){
    double cycles;
    cycles = isend_all2all(rank, nprocs, sendbuf, recvbuf, n,
			   sreqlist, rreqlist);
    stats.insert(cycles);
  }
  
  //basic check (cout used in an unsafe manner)
  for(int i=0; i < nprocs; i++){
    if(rank == i){
      for(int j=0; j < nprocs; j++)
	cout<<recvbuf[n*j]<<" ";
      cout <<endl<<endl;
    }
    MPI_Barrier(MPI_COMM_WORLD);
  }
  
  delete[] sendbuf;
  delete[] recvbuf;

  return stats.median();
}

void CreateOutputScatter(int rank, int nprocs){
  char ostring[200];
  ofstream ofile;
  if(rank==0){
    ofile.open("OUTPUT/scatter.txt", ios_base::app);
    long int posn = ofile.tellp();
    if(posn<=0){
      ofile<<"num of trials = "<<NUMREPEATS<<"/(n*nprocs)"<<endl;
      sprintf(ostring,"nprocs    &     n      &      b/w(scatter)    &     b/w(isend)");
      ofile<<ostring<<endl;
    }
  }
  int nlist[2] = {1000*100, 1000*1000};
  for(int i=0; i < 2; i++){
    int n = nlist[i];
    double cycles =  time_scatter(rank, nprocs, n);
    double bw_scatter = 16.0*n*nprocs/cycles;
    cycles = time_isend(rank, nprocs, n);
    double bw_isend = 16.0*n*nprocs/cycles;
    sprintf(ostring, "%6d & %12.2g & %12.3g &%12.3g", 
	    nprocs, (double)n, bw_scatter, bw_isend);
    if(rank == 0)
      ofile<<ostring<<endl;
  }
  if(rank==0)
    ofile.close();
}

int main(){
  int rank;
  int nprocs;
  mpi_initialize(rank, nprocs);
  CreateOutputBcast(rank, nprocs);
  CreateOutputScatter(rank, nprocs);
  MPI_Finalize();
}


