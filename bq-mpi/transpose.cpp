#include <iostream>
#include <iomanip>
#include <fstream>
#include <mpi.h>
#include <omp.h>
#include <cstdlib>
#include <cassert>
#include "TimeStamp.hh"
#include "StatVector.hh"
using namespace std;

double cycles_scopy;
double cycles_mpi;
double cycles_rcopy;
char outstring_with_split[200];
ofstream ofilePP;
#define OMPCPY
#ifdef OMPCPY
#define NTHREADS 10
#endif

void mpi_initialize(int& rank, int& nprocs){
  MPI_Init(NULL, NULL);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
}

//0=fst[0]<=...<=fst[P]=n at output
//the block owned by p is fst[p]<=i < fst[p+1]
//blocks are nearly even
//P = nprocs
void BlockDivide(long n, int P, long *fst){
  long  Q = n/P;
  long  R = n-Q*P;
  fst[0] = 0;
  for(int p=0; p < R; p++)
    fst[p+1] = fst[p] + (Q+1);
  for(int p=R; p < P; p++)
    fst[p+1] = fst[p]+Q;
}

class Transpose{
private:
  int p; //process rank
  int P; //number of processes
  long  M;
  long  N;
  long *fstM;
  long *fstN;
  double *sendbuf, *recvbuf;
  MPI_Request *sreqlist, *rreqlist;
  
public:
  Transpose(int rank, int nprocs, long Mi, long Ni);
  ~Transpose();
  long getM(int rank){return fstM[rank];};
  long getN(int rank){return fstN[rank];};
  void copyTOsendbuf(double *localMN);
  void postsend();
  void postrecv();
  void wait();
  void copyFROMrecvbuf(double *localNM);
  void transpose(double *localMN, double *localNM);
};


Transpose::Transpose(int rank, int nprocs, long Mi, long Ni)
    :p(rank), P(nprocs), M(Mi), N(Ni){    
  fstM = new long[P+1];
  fstN = new long[P+1];
  BlockDivide(M, P, fstM);
  BlockDivide(N, P, fstN);
  long ncols = fstN[p+1]-fstN[p];
  if(ncols*M > 0)
    sendbuf = new double[ncols*M];
    //MPI_Alloc_mem(8*ncols*M, MPI_INFO_NULL, (void *)(&sendbuf));
  else 
    sendbuf = NULL;
  long nrows = fstM[p+1]-fstM[p];
  if(nrows*N > 0)
    recvbuf = new double[nrows*N];
    //MPI_Alloc_mem(8*nrows*N, MPI_INFO_NULL, (void *)(&recvbuf));
  else
    recvbuf = NULL;
  sreqlist = new MPI_Request[P];
  rreqlist = new MPI_Request[P];
}

Transpose::~Transpose(){
  delete[] fstM;
  delete[] fstN;
  delete[] sreqlist;
  delete[] rreqlist;
  if(fstN[p+1]*M>fstN[p]*M)
    delete[] sendbuf;
  //MPI_Free_mem(sendbuf);
  if(fstM[p+1]*N>fstM[p]*N)
    delete[] recvbuf;
  //MPI_Free_mem(recvbuf);
}

#define B 50
void transposewlda(double *in, int lda, 
			   long nrows, long ncols,
			   double *out){
#ifdef OMPCPY
#pragma omp parallel for			\
  num_threads(NTHREADS)				\
  default(none)					\
  shared(in, lda, nrows, ncols, out)
  for(int i=0; i < nrows; i+=B)
    for(int j=0; j < ncols; j+=B){
      int iib = (nrows-i < B)?nrows-i:B;
      int jjb = (ncols-j < B)?ncols-j:B;
      for(int ii=0; ii < iib;ii++)
  	for(int jj=0; jj < jjb;jj++)
  	  out[j+jj+(i+ii)*ncols] = in[i+ii+(j+jj)*lda];
    }
#else
  for(long i=0; i < nrows; i++)
    for(long j=0; j < ncols; j++)
      out[j+i*ncols] = in[i+j*lda];
#endif
}

void Transpose::copyTOsendbuf(double *localMN){
  long ncols = fstN[p+1] - fstN[p];
  for(long q=0; q < P; q++){
    long nrows = fstM[q+1] - fstM[q];
    long sbufindex = ncols * fstM[q];
    long localindex = fstM[q];
    long lda = M;
    transposewlda(localMN+localindex, lda, 
			  nrows, ncols, 
			  sendbuf+sbufindex);
  }
}


void Transpose::postsend(){
  long ncols = fstN[p+1]-fstN[p];
  for(int q=0; q < P; q++){
    long nrows = fstM[q+1]-fstM[q];
    long sbufindex = ncols*fstM[q];
    int count = ncols*nrows; //MPI can't handle long
    int tag = 0;
    MPI_Isend(sendbuf+sbufindex, count, MPI_DOUBLE,
	      q, tag, MPI_COMM_WORLD, sreqlist+q);

  }
}

void Transpose::postrecv(){
  long ncols = fstM[p+1]-fstM[p];
  for(long q=0; q < P; q++){
    long nrows = fstN[q+1]-fstN[q];
    long rbufindex = ncols*fstN[q];
    int count = nrows*ncols;//MPI can't handle long
    int tag = 0;
    MPI_Irecv(recvbuf+rbufindex, count, MPI_DOUBLE, 
	      q, tag, MPI_COMM_WORLD, rreqlist+q);
  }
}

void Transpose::wait(){
  MPI_Status status;
  for(long q=0; q < P; q++)
    MPI_Wait(sreqlist+q, &status);
  for(long q=0; q < P; q++)
    MPI_Wait(rreqlist+q, &status);
}

void copywlda(double *in, int nrows, int ncols, double *out, int lda){
#ifdef OMPCPY
#pragma omp parallel for			\
  num_threads(NTHREADS)				\
  default(none)					\
  shared(in, nrows, ncols, out, lda, ofilePP)
  for(long j=0; j < ncols; j++)
    for(long i=0; i < nrows; i++)
      out[i+j*lda] = in[i+j*nrows];
#else
    for(long j=0; j < ncols; j++)
      for(long i=0; i < nrows; i++)
	out[i+j*lda] = in[i+j*nrows];
#endif
}

void Transpose::copyFROMrecvbuf(double *localNM){
  long ncols = fstM[p+1]-fstM[p];
  for(long q=0; q < P; q++){
    long nrows = fstN[q+1]-fstN[q];
    long rbufindex = ncols*fstN[q];
    long localindx = fstN[q];
    long lda = N;
    copywlda(recvbuf+rbufindex, nrows, ncols, localNM+localindx, lda);
  }
}

void Transpose::transpose(double *localMN, double *localNM){
  TimeStamp clk;
  clk.tic();
  copyTOsendbuf(localMN);
  cycles_scopy = clk.toc();
  clk.tic();
  postsend();
  postrecv();
  wait();
  cycles_mpi = clk.toc();
  clk.tic();
  copyFROMrecvbuf(localNM);
  cycles_rcopy = clk.toc();
}

//M < 1000 is assumed
void runtransposeA(int rank, int nprocs, long M, long N){
  char fname[200];
  sprintf(fname, "outP%d.txt", rank);
  ofilePP.open(fname);
  Transpose trans(rank, nprocs, M, N);
  double *localMN;
  double *localNM;
  localMN=new double[(trans.getN(rank+1)-trans.getN(rank))*M];
  localNM=new double[(trans.getM(rank+1)-trans.getM(rank))*N];
  for(long i=0; i < N*(trans.getM(rank+1)-trans.getM(rank)); i++)
	localNM[i] = -1;
  double base = 1000000;
  while(base <= trans.getN(nprocs))
    base *= 10;
  for(long col=0; col < trans.getN(rank+1)-trans.getN(rank); col++)
    for(long row = 0; row < M; row++)
      localMN[row+col*M] = base*row + col+trans.getN(rank);
  ofilePP<<"Matrix sent:"<<endl;
  long nrows=M;
  for(long row=0; row < nrows; row++){
    for(int col=0; col < (trans.getN(rank+1)-trans.getN(rank)); col++)
      ofilePP<<(int)localMN[row+col*nrows]<<" ";
    ofilePP<<endl;
  }
  trans.transpose(localMN, localNM);
  ofilePP<<"Matrix Received:"<<endl;
  nrows = N;
  for(long row=0; row < nrows; row++){
    for(long col=0; col < trans.getM(rank+1)-trans.getM(rank); col++)
      ofilePP<<(int)localNM[row+col*nrows]<<" ";
    ofilePP<<endl;
  }
  delete[] localMN;
  delete[] localNM;
  ofilePP.close();
}

void runtransposeB(int rank, int nprocs, long M, long N){
  Transpose transmn(rank, nprocs, M, N);
  Transpose transnm(rank, nprocs, N, M);
  double *localMN;
  double *localNM;
  double *localMNX;
  int localm = (transmn.getM(rank+1)-transmn.getM(rank));
  int localn = (transmn.getN(rank+1)-transmn.getN(rank));
  localMN = new double[M*localn];
  localMNX = new double[M*localn];
  localNM = new double[N*localm];
  for(int i=0; i < M*localn; i++)
    localMN[i] = 1.0*rand()/RAND_MAX-0.5;
  transmn.transpose(localMN, localNM);
  transnm.transpose(localNM, localMNX);
  double err = 0;
  for(int i=0; i < M*localn; i++)
    if(fabs(localMN[i]-localMNX[i])>err)
      err = fabs(localMN[i]-localMNX[i]);
  for(int i=0; i < nprocs; i++){
    if(i==rank)
      cout<<"rank = "<<rank<<" error = "<<err<<endl;;
    MPI_Barrier(MPI_COMM_WORLD);
  }
  delete[] localMN;
  delete[] localMNX;
  delete[] localNM;
}

struct trans_stat{
  double bw; 
  double frac_scopy;
  double frac_mpi;
  double frac_rcopy;
};

struct trans_stat 
time_transpose(int rank, int nprocs, long M, long N){
  int count = 100;
  StatVector stats(count);
  StatVector stats_scopy(count), stats_mpi(count), stats_rcopy(count);
  double *localMN;
  double *localNM;
  Transpose transmn(rank, nprocs, M, N);
  Transpose transnm(rank, nprocs, N, M);
  int localm = transmn.getM(rank+1)-transmn.getM(rank);
  int localn = transmn.getN(rank+1)-transmn.getN(rank);
  localMN=new double[M*localn];
  localNM=new double[localm*N];
  transmn.transpose(localMN, localNM);//numa awareness
  transnm.transpose(localNM, localMN);
  for(long i=0;i < M*localn; i++)
    localMN[i] = rand()*1.0/RAND_MAX-0.5;
  for(int i=0; i < count; i++){
    TimeStamp clk;
    double sc, mpi, rc;
    clk.tic();
    transmn.transpose(localMN, localNM);
    sc = cycles_scopy;
    mpi= cycles_mpi;
    rc = cycles_rcopy;
    transnm.transpose(localNM, localMN);
    double cycles = clk.toc();
    stats.insert(cycles);
    stats_scopy.insert(sc+cycles_scopy);
    stats_mpi.insert(mpi+cycles_mpi);
    stats_rcopy.insert(rc+cycles_rcopy);
  }
  delete[] localMN;
  delete[] localNM;
  double frac_scopy = stats_scopy.median()/stats.median();
  double frac_mpi = stats_mpi.median()/stats.median();
  double frac_rcopy = stats_rcopy.median()/stats.median();
  double bw = (M*localn+localm*N)*8.0*2.0/stats.median();
  struct trans_stat ans;
  ans.bw = bw;
  ans.frac_scopy = frac_scopy;
  ans.frac_mpi = frac_mpi;
  ans.frac_rcopy = frac_rcopy;
  return ans;
}

void WriteOutput(int rank, int nprocs, int argc, char **argv){
  ofstream ofile;
  if(rank==0){
#ifdef OMPCPY
    ofile.open("OUTPUT/transposex.txt", ios_base::app);
#else
    ofile.open("OUTPUT/transpose.txt", ios_base::app);
#endif
    long int posn = ofile.tellp();
    if(posn<=0)
      ofile<<setw(8)<<"nprocs"
	   <<setw(8)<<"M"
	   <<setw(10)<<"N/nprocs"
	   <<setw(10)<<"b/w"
	   <<setw(8)<<"scopy%"
	   <<setw(8)<<"mpi%"
	   <<setw(8)<<"rcopy%"<<endl;
  }
  int M = atoi(*++argv);
  int N = atoi(*++argv);
  N = N*nprocs;
  struct trans_stat statlist;
  statlist = time_transpose(rank, nprocs, M, N);
  ofile.precision(3);
  if(rank==0){
    ofile<<setw(8)<<nprocs
	 <<setw(8)<<M
	 <<setw(10)<<N/nprocs
	 <<setw(10)<<statlist.bw
	 <<setw(8)<<statlist.frac_scopy
	 <<setw(8)<<statlist.frac_mpi
	 <<setw(8)<<statlist.frac_rcopy<<endl;
  }
}

int main(int argc, char **argv){
  int rank;
  int nprocs;
  mpi_initialize(rank, nprocs);
  //runtransposeA(rank, nprocs, 107, 56);
  runtransposeB(rank, nprocs, 1017, 537);
  WriteOutput(rank, nprocs, argc, argv);
  ofilePP.close();
  MPI_Finalize();
}
