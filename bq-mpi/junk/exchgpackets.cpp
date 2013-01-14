#include <iostream>
#include <fstream>
#include <mpi.h>
#include <cstdlib>
#include <cassert>
#include "StatVector.hh"
#include "TimeStamp.hh"
using namespace std;

void mpi_initialize(int& rank, int& nprocs){
  MPI_Init(NULL, NULL);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
}

class Exchg{
private:
  int rank;
  int nprocs;
  double *sendbuf;
  double *recvbuf;
  int bufsize;
  int numpackets;
  MPI_Request* sreqlist;
  MPI_Request* rreqlist;
  MPI_Status* statuslist;
  TimeStamp clk;
public:
  Exchg(int ranki, int nprocsi, int bufsize, int numpackets);
  ~Exchg();
  void post();
  double wait();
  double& operator()(int i){return sendbuf[i];};
};


#define EXMPIALLOCMEM

Exchg::Exchg(int ranki, int nprocsi, int bsize, int npackets){
  rank = ranki;
  nprocs = nprocsi;
  bufsize = bsize;
  numpackets = npackets;
  assert(bufsize%numpackets==0);
  int packetsize = bufsize/numpackets;
#ifdef EXMPIALLOCMEM
  sreqlist = new MPI_Request[numpackets];
  rreqlist = new MPI_Request[numpackets];
#else
  sendbuf = new double[bufsize];
  recvbuf = new double[bufsize];
#endif
  MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&sendbuf));
  MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&recvbuf));
  int tag = 0;//different tags for different sends?
  if(rank==0){
    for(int  i=0; i < numpackets; i++){
      MPI_Send_init(sendbuf+i*packetsize, packetsize, MPI_DOUBLE, 
		    nprocs-1, tag, MPI_COMM_WORLD, 
		    sreqlist+i);
      MPI_Recv_init(recvbuf+i*packetsize, packetsize, MPI_DOUBLE, 
		    nprocs-1, tag, MPI_COMM_WORLD, 
		    rreqlist+i);
    }
  }
  else if(rank==nprocs-1){
    for(int  i=0; i < numpackets; i++){
      MPI_Send_init(sendbuf+i*packetsize, packetsize, MPI_DOUBLE, 
		    0, tag, MPI_COMM_WORLD, 
		    sreqlist+i);
      MPI_Recv_init(recvbuf+i*packetsize, packetsize, MPI_DOUBLE, 
		    0, tag, MPI_COMM_WORLD, 
		    rreqlist+i);
    }
  }
  statuslist = new MPI_Status[numpackets];
}

Exchg::~Exchg(){
#ifdef EXMPIALLOCMEM
  MPI_Free_mem(sendbuf);
  MPI_Free_mem(recvbuf);
#else
  delete[] sendbuf;
  delete[] recvbuf;
#endif
  for(int i=0; i < numpackets; i++){
    MPI_Request_free(sreqlist+i);
    MPI_Request_free(rreqlist+i);
  }
  delete[] sreqlist;
  delete[] rreqlist;
  delete[] statuslist;
}

void Exchg::post(){
  clk.tic();
  MPI_Startall(numpackets, sreqlist);
  MPI_Startall(numpackets, rreqlist);
}

double Exchg::wait(){
  MPI_Status status;
  if((rank==0)||(rank==nprocs-1)){
    MPI_Waitall(numpackets, sreqlist, statuslist);
    MPI_Waitall(numpackets, rreqlist, statuslist);
  }
  double cycles = clk.toc();
  for(int i=0; i < bufsize; i++)
    sendbuf[i]=recvbuf[i];
  return cycles;
}

void CreateOutput(int rank, int nprocs){
  ofstream ofile;
  char ostring[200];
  int count = 3;
  if(rank==0){
    ofile.open("OUTPUT/exchangeINpacketsMPIMemAlloc.txt");
    ofile<<"count = "<<count<<endl;
    sprintf(ostring,"           n             p             b/w");
    ofile<<ostring<<endl;
  }
  int n = 1000*1000*10;
  int p[6] = {100, 1000, 1000*10, 1000*100, 1000*1000, 
	      1000*1000*10};
  for(int i=0; i < 6; i++){
    Exchg xchg(rank, nprocs, n, n/p[i]);
    for(int j=0; j < n; j++)
      xchg(j) = (rank+1)*10;
    StatVector stats(count);
    for(int j=0; j < count; j++){
      xchg.post();
      double cycles = xchg.wait();
      stats.insert(cycles);
    }
    double mcycles = stats.median();
    double bwidth = 16.0*n/mcycles;
    sprintf(ostring,"%12.2g & %12.2g & %12.3g", 
	    (double)n, (double)p[i], bwidth);
    if(rank==0)
      ofile<<ostring<<endl;
    count *= 1.8;
  }
  if(rank==0)
    ofile.close();
}

int main(){
  int rank;
  int nprocs;
  mpi_initialize(rank, nprocs);
  CreateOutput(rank, nprocs);
  MPI_Finalize();
}
