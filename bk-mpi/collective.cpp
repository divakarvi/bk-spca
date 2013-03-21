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

double bcast_loop(int rank, int nprocs, double *buffer, int bufsize){
  TimeStamp clk;
  int tag=0;
  
  clk.tic();
  if(rank==0){
    MPI_Request *reqlist=new MPI_Request[nprocs-1];
    for(int destn=1; destn<nprocs; destn++) 
      MPI_Isend(buffer, bufsize, MPI_DOUBLE,
		destn, tag, MPI_COMM_WORLD, 
		reqlist+destn-1);
    MPI_Waitall(nprocs-1,reqlist,MPI_STATUS_IGNORE);
  }
  else{
    MPI_Request req;
    MPI_Irecv(buffer, bufsize, MPI_DOUBLE,
	      0, tag, MPI_COMM_WORLD, &req);
    MPI_Wait(&req, MPI_STATUS_IGNORE);
  }
  double cycles = clk.toc();
  return cycles;
}

double time_bcast(int rank, int nprocs, int n, int flag){
  int count = 500;
  StatVector stats(count);
  double *buffer;
  buffer = new double[n];
  if(rank==0)
    for(int i=0; i < n; i++)
      buffer[i] = 28;
  for(int i=0; i < count; i++){
    double cycles;
    if(flag==0)
      cycles = bcast(rank, nprocs, buffer, n);
    else
      cycles = bcast_loop(rank, nprocs, buffer, n);
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
      ofile<<"num of trials = "<<500<<endl;
      sprintf(ostring,"nprocs    &     bufsize   &      b/w  &   cycles");
      ofile<<ostring<<endl;
    }
  }
  int nlist[4] = {1, 100, 1000*100, 1000*1000};
  for(int flag=0; flag < 2; flag++){//or flag<2
    ofile<<((flag==0)?"mpi_bcast":"loop_bcast")<<endl;
    for(int  i=0; i < 4; i++){
      int n = nlist[i];
      double cycles = time_bcast(rank, nprocs, n, flag);
      double bw = 8.0*n/cycles;
      sprintf(ostring, "%6d & %12.2g & %12.3g & %12.3g", 
	      nprocs, (double)n, bw, cycles);
      if(rank == 0)
	ofile<<ostring<<endl;
      //ofile<<"mvapich2:"<<endl<<ostring<<endl;
    }
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

double mpi_all2all(int rank, int nprocs, 
		       double *sendbuf, double *recvbuf, int n){
  TimeStamp clk;
  clk.tic();
  MPI_Alltoall(sendbuf, n, MPI_DOUBLE, recvbuf, n, MPI_DOUBLE,
	       MPI_COMM_WORLD);
  double cycles = clk.toc();
  return cycles;
}


MPI_Request *all2all_init(int rank, int nprocs, 
			  double *sendbuf, double *recvbuf, int n){
  MPI_Request *reqlist = new MPI_Request[2*nprocs];
  for(int i=0; i < nprocs; i++) {
    int dest = i;
    int tag = rank;
    MPI_Send_init(sendbuf+dest*n, n, MPI_DOUBLE, dest, tag, 
		  MPI_COMM_WORLD, reqlist+i);
  }
  for(int i=0; i < nprocs; i++){
    int source = i;
    int tag = source;
    MPI_Recv_init(recvbuf+source*n, n, MPI_DOUBLE, source, tag, 
		  MPI_COMM_WORLD, reqlist+nprocs+i);
  }
  return reqlist;
}

double all2all(int rank, int nprocs, MPI_Request* reqlist){
  TimeStamp clk;
  clk.tic();
  MPI_Startall(2*nprocs, reqlist);
  MPI_Waitall(2*nprocs, reqlist, MPI_STATUS_IGNORE);
  double cycles = clk.toc();
  return cycles;
}

void all2all_finalize(MPI_Request *reqlist){
  delete[] reqlist;
}

double time_scatter(int rank, int nprocs, int n, int flag){
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
    if(flag==0)
      cycles = scatter_all2all(rank, nprocs, sendbuf, recvbuf, n);
    else
      cycles = mpi_all2all(rank, nprocs, sendbuf, recvbuf, n);
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

double time_all2all(int rank, int nprocs, int n){
  int count = NUMREPEATS/(n*nprocs);
  StatVector stats(count);
  double* sendbuf;
  double* recvbuf;
  sendbuf = new double[n*nprocs];
  recvbuf = new double[n*nprocs];
  MPI_Request *reqlist;
  reqlist = all2all_init(rank, nprocs, sendbuf, recvbuf, n);
			  
  int base = 10;
  while(base < nprocs)
    base *= 10;
  for(int dest = 0; dest < nprocs; dest++)
    for(int j=0; j < n; j++)
      sendbuf[n*dest+j] = rank*base+dest; 
  for(int i=0; i < count; i++){
    double cycles;
    cycles = all2all(rank, nprocs, reqlist);
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
  all2all_finalize(reqlist);
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
    double cycles =  time_scatter(rank, nprocs, n, 0);
    double bw_scatter = 16.0*n*nprocs/cycles;
    cycles = time_all2all(rank, nprocs, n);
    double bw_isend = 16.0*n*nprocs/cycles;//persistent send
    cycles =  time_scatter(rank, nprocs, n, 1);
    double bw_mpia2a = 16.0*n*nprocs/cycles;
    sprintf(ostring, "%6d & %12.2g & %12.3g & %12.3g & %12.3g", 
	    nprocs, (double)n, bw_scatter, bw_isend, bw_mpia2a);
    if(rank == 0)
      ofile<<ostring<<endl;
  }
  if(rank==0)
    ofile.close();
}

double reducemin(int rank, int nprocs, 
		double *sendbuf, double *recvbuf, int bufsize){
  TimeStamp clk;
  clk.tic();
  MPI_Allreduce(sendbuf, recvbuf, bufsize, MPI_DOUBLE,
		MPI_MIN, MPI_COMM_WORLD);
  double cycles = clk.toc();
  return cycles;
}

int log2i(int P){
  int ans=0;
  int flag = 0;
  while(P>1){
    if(P%2==1)
      flag = 1;
    P /= 2;
    ans++;
  }
  ans += flag;
  return ans;
}

double reducemin_loop(int rank, int nprocs,
		      double *sendbuf, double *recvbuf, 
		      double *scratch, int bufsize){
  TimeStamp clk;
  clk.tic();
  int log2P=log2i(nprocs);
  for(int i=0; i < bufsize; i++)
    scratch[i] = sendbuf[i];
  int biti = 1;
  for(int i=0; i < log2P; i++){
    if((biti&rank) > 0){
      int destn=rank&(~biti);
      MPI_Request req;
      MPI_Isend(scratch, bufsize, MPI_DOUBLE, destn, i, 
		MPI_COMM_WORLD, &req);
      MPI_Wait(&req, MPI_STATUS_IGNORE);
      break;
    }
    else{
      int source = rank|biti;
      if(source < nprocs){
	MPI_Request req;
	MPI_Irecv(recvbuf, bufsize, MPI_DOUBLE, source, i,
		  MPI_COMM_WORLD, &req);
	MPI_Wait(&req, MPI_STATUS_IGNORE);
	for(int j=0; j < bufsize; j++)
	  if(recvbuf[j]<scratch[j])
	    scratch[j] = recvbuf[j];
      }
    }
    biti=biti<<1;
  }
  if(rank==0)
    for(int i=0; i < bufsize; i++)
      recvbuf[i] = scratch[i];
  int root=0;
  MPI_Bcast(recvbuf, bufsize, MPI_DOUBLE, root, MPI_COMM_WORLD);
  double cycles = clk.toc();
  return cycles;
}
		
double time_reduce(int rank, int nprocs, int n, int flag){
  const int count = 500;
  StatVector stats(count);
  double *sendbuf = new double[n];
  double *recvbuf = new double[n];
  double *scratch = new double[n];
  srand(rank+100);
  for(int i=0; i < n; i++)
    sendbuf[i] = rand()*1.0/RAND_MAX;
  double cycles;
  for(int i=0; i < count; i++){
    if(flag==0)
      cycles = reducemin(rank, nprocs, sendbuf, recvbuf, n);
    else
      cycles = reducemin_loop(rank, nprocs, sendbuf, recvbuf,
			      scratch, n);
    stats.insert(cycles);
  }
  for(int i=0; i < nprocs; i++){//basic check
    if(rank==i)
      cout<<rank<<":"<<sendbuf[n/2]<<" "<<recvbuf[n/2]<<endl;
    if(rank==(nprocs-1))
      cout<<endl<<endl;
    MPI_Barrier(MPI_COMM_WORLD);
  }
  delete[] sendbuf;
  delete[] recvbuf;
  delete[] scratch;
  return stats.median();
}

void CreateOutputReduce(int rank, int nprocs){
  char ostring[200];
  ofstream ofile;
  if(rank==0){
    ofile.open("OUTPUT/reduce.txt", ios_base::app);
    long posn = ofile.tellp();
    if(posn<=0){
      ofile<<"num of trials = "<<500<<endl;
      ofile<<"\t"<<"nprocs"<<"\t"<<"bufsize"<<"\t\t"<<"cycles"<<endl;
    }
  } 
  int nlist[4] = {1, 100, 1000*100, 1000*1000};
  for(int flag=0; flag<2; flag++){
    ofile<<((flag==0)?"mpi_reduce":"loop_reduce")<<endl;
    for(int i=0; i < 4; i++){
      int n = nlist[i];
      double cycles = time_reduce(rank, nprocs, n, flag);
      ofile<<"\t"<<nprocs<<"\t"<<(double)n<<"\t\t"<<cycles<<endl;
    }
  }
}

int main(){
  int rank;
  int nprocs;
  mpi_initialize(rank, nprocs);
  CreateOutputBcast(rank, nprocs);
  //CreateOutputScatter(rank, nprocs);
  //CreateOutputReduce(rank, nprocs);
  MPI_Finalize();
}


