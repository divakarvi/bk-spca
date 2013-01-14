#include "TimeStamp.hh"
#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include <omp.h>
#include <mpi.h>
using namespace std;
const int NTHREADS=12;


class Jacobi2D{
private:
  double *a;
  double *b;
  double *left;
  double *lleft;
  double *right;
  double *rright;
  double *bleft, *bright;
  int dim1;
  int dim2;
  int lrank;
  int rrank;
  MPI_Request sreq1, sreq2, rreq1, rreq2;
public:
  Jacobi2D(int d1, int d2, int rank, int nprocs);
  ~Jacobi2D();
  void leftrightinit();
  void initialize(int col1, int col2);
  void initializepp();
  void postsendrecv();
  void updateinterior(int col1, int col2);
  void updateinteriorpp();
  void wait();
  void updateboundary();
  void copy(int col1, int col2);
  void copypp();
  double& operator()(int i, int j){return a[i+j*dim1];}
  double& l(int i){return left[i];}
  double& r(int i){return right[i];}
};


Jacobi2D::Jacobi2D(int d1, int d2, int rank, int nprocs){
  dim1 = d1;
  dim2 = d2;
  a = new double[dim1*dim2];
  b = new double[dim1*dim2];
  MPI_Alloc_mem(4*dim1*8, MPI_INFO_NULL, (void *)(&left));
  lleft = left+dim1;
  right = left+2*dim1;
  rright = left+3*dim1;
  bleft = new double[dim1];
  bright = new double[dim1];
  lrank = (rank==0)?nprocs-1:rank-1;
  rrank = (rank==nprocs-1)?0:rank+1;
  int tag = 0;
  MPI_Send_init(left, dim1, MPI_DOUBLE, lrank, tag, 
		MPI_COMM_WORLD, &(sreq1));
  MPI_Send_init(right, dim1, MPI_DOUBLE, rrank, tag, 
		MPI_COMM_WORLD, &(sreq2));
  MPI_Recv_init(lleft, dim1, MPI_DOUBLE, lrank, tag, 
		MPI_COMM_WORLD, &(rreq1));
  MPI_Recv_init(rright, dim1, MPI_DOUBLE, rrank, tag, 
		MPI_COMM_WORLD, &(rreq2));
}

Jacobi2D::~Jacobi2D(){
  MPI_Free_mem(left);
  MPI_Request_free(&sreq1);
  MPI_Request_free(&sreq2);
  MPI_Request_free(&rreq1);
  MPI_Request_free(&rreq2);
  delete[] a;
  delete[] b;
  delete[] bleft;
  delete[] bright;
}

void Jacobi2D::initialize(int col1, int col2){//chessboard pattern
  for(int j=col1; j < col2; j++)
    for(int i=0; i < dim1; i++){
      a[i+j*dim1] = ((i+j)%2==0)?1:-1;
      b[i+j*dim1] = 0;
    }
  if(col1 == 0)
    for(int i = 0; i < dim1; i++){
      left[i] = ((i+1)%2==0)?1:-1;
      right[i] = (i%2==0)?1:-1;
      bleft[i] = 0;
      bright[i] = 0;
    }
}

void Jacobi2D::initializepp(){
#pragma omp parallel				\
  num_threads(NTHREADS)				\
  default(none)					
  {
    int tid = omp_get_thread_num();
    int col1 = tid*dim2/NTHREADS;
    int col2 = (tid+1)*dim2/NTHREADS;
    this->initialize(col1, col2);
  }
}

void Jacobi2D::postsendrecv(){
  MPI_Start(&sreq1);
  MPI_Start(&sreq2);
  MPI_Start(&rreq2);
  MPI_Start(&rreq1);
}

void Jacobi2D::wait(){
  MPI_Status status;
  MPI_Wait(&sreq1, &status);
  MPI_Wait(&sreq2, &status);
  MPI_Wait(&rreq2, &status);
  MPI_Wait(&rreq1, &status);
}

void Jacobi2D::updateinterior(int col1, int col2){
  if(col1 == 0){
    int j = 0;
    for(int i=0; i < dim1; i++){
      int iup = (i==0)?(dim1-1):i-1;
      int idown = (i==dim1-1)?0:i+1;
      b[i+j*dim1] = 0.25*(a[iup+j*dim1]+a[idown+j*dim1]
			 +left[i]+a[i+(j+1)*dim1]);
    }
    col1++;
  }
  if(col2==dim2){
    int j = dim2-1; 
    for(int i=0; i < dim1; i++){
      int iup = (i==0)?(dim1-1):i-1;
      int idown = (i==dim1-1)?0:i+1;
      b[i+j*dim1] = 0.25*(a[iup+j*dim1]+a[idown+j*dim1]
			 +a[i+(j-1)*dim1]+right[i]);
    }
    col2--;
  }
  for(int j=col1; j < col2; j++)
    for(int i=0; i < dim1; i++){
      int iup = (i==0)?(dim1-1):i-1;
      int idown = (i==dim1-1)?0:i+1;
      b[i+j*dim1] = 0.25*(a[iup+j*dim1]+a[idown+j*dim1]
			 +a[i+(j-1)*dim1]+a[i+(j+1)*dim1]);
    }
}

void Jacobi2D::updateinteriorpp(){
#pragma omp parallel				\
  num_threads(NTHREADS)				\
  default(none)					
  {
    int tid = omp_get_thread_num();
    int col1 = tid*dim2/NTHREADS;
    int col2 = (tid+1)*dim2/NTHREADS;
    this->updateinterior(col1, col2);
  }
}

void Jacobi2D::updateboundary(){
  for(int i=0; i < dim1; i++){
    int iup = (i==0)?(dim1-1):i-1;
    int idown = (i==dim1-1)?0:i+1;
    bleft[i] = 0.25*(left[iup]+left[idown]+lleft[i]+a[i]);
    bright[i] = 0.25*(right[iup]+right[idown]+
		     a[i+(dim2-1)*dim1]+rright[i]);
  }
}

void Jacobi2D::copy(int col1, int col2){
  for(int j=col1; j < col2; j++)
    for(int i=0; i < dim1; i++)
      a[i+j*dim1] = b[i+j*dim1];
  if(col1 == 0)
    for(int i=0; i < dim1; i++){
      left[i] = bleft[i];
      right[i] = bright[i];
    }
}

 

void Jacobi2D::copypp(){
#pragma omp parallel				\
  num_threads(NTHREADS)				\
  default(none)					
  {
    int tid = omp_get_thread_num();
    int col1 = tid*dim2/NTHREADS;
    int col2 = (tid+1)*dim2/NTHREADS;
    this->copy(col1, col2);
  }
}

void mpi_initialize(int& rank, int& nprocs){
  int provided=-10;
  MPI_Init_thread(NULL, NULL, MPI_THREAD_FUNNELED, &provided);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
  if(rank==0)
    switch(provided){
    case MPI_THREAD_SINGLE:
      cout<<"thread support = single"<<endl;
      break;
    case MPI_THREAD_FUNNELED:
      cout<<"thread support = funneled"<<endl;
      break;
    case MPI_THREAD_SERIALIZED:
      cout<<"thread support = serialized"<<endl;
      break;
    case MPI_THREAD_MULTIPLE:
      cout<<"thread support = multiple"<<endl;
      break;
    }
}

//this function has two processes writing to cout.
//NOT a good idea in general!
void printStuff(Jacobi2D& jacobi, 
		int rank, int nprocs, 
		int dim1, int dim2, int nitns){//minimal check of correctness
  if(rank==0){
    cout<<endl<<endl;
    cout<<"error check info for Jacobi"<<endl;
    cout<<"dim1 = "<<dim1<<endl;
    cout<<"dim2 = "<<dim2<<endl;
    cout<<"rank = "<<rank<<endl;
    cout<<"nprocs = "<<nprocs<<endl;
    cout<<"nitns = "<<nitns<<endl;
    for(int i = 0; i < 6; i++){
      cout<<jacobi.l(i)<<" ";
      for(int j = 0; j < 6; j++){
	cout<<jacobi(i,j)<<" ";
      }
      cout<<endl;
    }
  }  
  MPI_Barrier(MPI_COMM_WORLD);
  if(rank==nprocs-1){
    cout<<endl<<endl;
    cout<<"rank = "<<rank<<endl;
    for(int i = 0; i < 6; i++){
      for(int j = dim2-6; j < dim2; j++){
	cout<<jacobi(i,j)<<" ";
      }
      cout<<jacobi.r(i)<<" ";
      cout<<endl;
    }
  }
  MPI_Barrier(MPI_COMM_WORLD);
}

void IterateJacobi(int rank, int nprocs, int dim1, int dim2, int nitns){
   Jacobi2D jacobi(dim1, dim2, rank, nprocs);
   jacobi.initializepp();
   TimeStamp clk;
   clk.tic();
   for(int n=0; n < nitns; n++){
     jacobi.postsendrecv();
     jacobi.updateinteriorpp();
     jacobi.wait();
     jacobi.updateboundary();
     jacobi.copypp();
   }
   double cycles = clk.toc();
   if(rank==0){
     ofstream ofile("OUTPUT/Jacobi.txt", ios_base::app);
     ofile<<setw(15)<<nprocs<<setw(13)<<dim1<<
       setw(14)<<dim2<<setw(20)<<cycles/nitns/dim1/(dim2+2)<<endl;
     ofile.close();
   }
   printStuff(jacobi, rank, nprocs, dim1, dim2, nitns);
}

void RunCmdLine(int argc, char **argv, int rank, int nprocs){
  if(argc < 4){
    if(rank==0){
      cout<<"Usage :"<<argv[0]<<" dim1 dim2 nitns"<<endl;
      cout<<"dim1 must be even and dim2 must be a multiple of 12"<<endl;
    }
    return;
  }
  int dim1 = atoi(*++argv);
  int dim2 = atoi(*++argv);
  int nitns = atoi(*++argv);
  assert(dim1%2==0);
  assert(dim2%12==0);
  if((dim1%2 != 0) || (dim2%12 != 0)){
    if(rank==0){
      cout<<"Usage :"<<argv[0]<<" dim1 dim2 nitns"<<endl;
      cout<<"dim1 must be even and dim2 must be a multiple of 12"<<endl;
    }
    return;
  }
  double cycles;
  IterateJacobi(rank, nprocs, dim1, dim2, nitns);
}

int main(int argc, char **argv){
  int rank;
  int nprocs;
  mpi_initialize(rank, nprocs);
  RunCmdLine(argc, argv, rank, nprocs);
  MPI_Finalize();
}
