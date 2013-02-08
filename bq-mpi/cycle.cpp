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
  MPI_Init(NULL,NULL);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
  char procname[200];
  int procnamelen;
  MPI_Get_processor_name(procname, &procnamelen);
  cout<<"proc name = "<<procname<<" rank = "<<rank<<endl;
}

class Cycle{
private:
  double *sendbufl, *sendbufr;
  double *recvbufl, *recvbufr;
  int bufsize;
  MPI_Request sreq1, sreq2;
  MPI_Request rreq1, rreq2;
  TimeStamp clk;
public:
  Cycle(int rank, int nprocs, int bufsize);
  ~Cycle();
  void post();
  double wait();
  double& left(int i){return sendbufl[i];};
  double& right(int i){return sendbufr[i];};
};

#define USEMPIALLOCMEM

Cycle::Cycle(int rank, int nprocs, int bsize){
  bufsize = bsize;
#ifdef USEMPIALLOCMEM
  MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&sendbufl));
  MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&recvbufl));
  MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&sendbufr));
  MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&recvbufr));
#else
  sendbufl = new double[bufsize];
  sendbufr = new double[bufsize];
  recvbufl = new double[bufsize];
  recvbufr = new double[bufsize];
#endif
  int left = (rank==0)?nprocs-1:rank-1;
  int right = (rank==nprocs-1)?0:rank+1;
  int tagl = 0;
  int tagr = 1;
  MPI_Send_init(sendbufl, bufsize, MPI_DOUBLE, left, tagl, 
		MPI_COMM_WORLD, &sreq1);
  MPI_Send_init(sendbufr, bufsize, MPI_DOUBLE, right, tagr, 
		MPI_COMM_WORLD, &sreq2);
  MPI_Recv_init(recvbufl, bufsize, MPI_DOUBLE, left, tagr, 
		MPI_COMM_WORLD, &rreq1);
  MPI_Recv_init(recvbufr, bufsize, MPI_DOUBLE, right, tagl, 
		MPI_COMM_WORLD, &rreq2);
}

Cycle::~Cycle(){
#ifdef USEMPIALLOCMEM
  MPI_Free_mem(sendbufl);
  MPI_Free_mem(recvbufl);
  MPI_Free_mem(sendbufr);
  MPI_Free_mem(recvbufr);
#else
  delete[] sendbufl;
  delete[] sendbufr;
  delete[] recvbufl;
  delete[] recvbufr;
#endif
  MPI_Request_free(&sreq1);
  MPI_Request_free(&sreq2);
  MPI_Request_free(&rreq1);
  MPI_Request_free(&rreq2);
}

void Cycle::post(){
  clk.tic();
  MPI_Start(&sreq1);
  MPI_Start(&sreq2);
  MPI_Start(&rreq1);
  MPI_Start(&rreq2);
}

double Cycle::wait(){
  MPI_Wait(&sreq1, MPI_STATUS_IGNORE);
  MPI_Wait(&sreq2, MPI_STATUS_IGNORE);
  MPI_Wait(&rreq1, MPI_STATUS_IGNORE);
  MPI_Wait(&rreq2, MPI_STATUS_IGNORE);
  double ticks = clk.toc();
  for(int i=0; i < bufsize; i++){
    sendbufr[i]=recvbufl[i];
    sendbufl[i]=recvbufr[i];
  }
  return ticks;
}

void CreateOutput(int rank, int nprocs){
  ofstream ofile;
  if(rank==0){
    ofile.open("OUTPUT/cycle.txt", ios_base::app);
    char ostring[200];
    long int posn = ofile.tellp();
    if(posn<=0){
      ofile<<"num of trials = "<<NUMREPEATS<<"/bufsize"<<endl;
      sprintf(ostring,"nprocs         bufsize            b/w");
      ofile<<ostring<<endl;
    }
  }
  int n[6] = {1000, 1000*10, 1000*100, 1000*1000, 
	     1000*1000*10, 1000*1000*100};
  for(int i=0; i < 6; i++){
    int count = NUMREPEATS/n[i];
    Cycle lrcycle(rank, nprocs, n[i]);
    for(int j=0; j < n[i]; j++){
      lrcycle.left(j) = (rank+1)*10;
      lrcycle.right(j) = -(rank+1)*10;
    }
    StatVector stats(count);
    for(int j=0; j < count; j++){
      lrcycle.post();
      double cycles = lrcycle.wait();
      stats.insert(cycles);
      //if((rank==0)&&(j < 2*nprocs))
      //cout<<"rank 0: left(i) = "<<lrcycle.left(0)<<
      //  " right(i) = "<<lrcycle.right(0)<<endl;
    }
    double bwidth = 32.0*n[i]/stats.median();
    char ostring[200];
    sprintf(ostring, "%6d & %12.2g & %12.3g", nprocs, (double)n[i], bwidth);
    if(rank==0)
      ofile<<ostring<<endl;
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
