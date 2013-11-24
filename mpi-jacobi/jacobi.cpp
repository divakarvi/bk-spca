#include "../utils/utils.hh"
#include "../mpi-init/mpi_init.hh"
#include "jacobi.hh"
#include <mpi.h>
#include <omp.h>


Jacobi2D::Jacobi2D(int rank, int nprocs, int d1, int d2, int nth){
	nthreads = nth;
	dim1 = d1;
	dim2 = d2;
	assrt(dim1%2 == 0);
	assrt(dim2%2 == 0);

	a = new double[dim1*dim2];
	b = new double[dim1*dim2];
	al = new double[dim1];
	ar = new double[dim1];
	bl = new double[dim1];
	br = new double[dim1];
	ll = new double[dim1];
	rr = new double[dim1];

	lrank = (rank==0)?nprocs-1:rank-1;
	rrank = (rank==nprocs-1)?0:rank+1;

	int tag = 0;
	MPI_Send_init(al, dim1, MPI_DOUBLE, lrank, tag, 
		      MPI_COMM_WORLD, reqlist+0);
	MPI_Send_init(ar, dim1, MPI_DOUBLE, rrank, tag, 
		      MPI_COMM_WORLD, reqlist+1);
	MPI_Recv_init(ll, dim1, MPI_DOUBLE, lrank, tag, 
		      MPI_COMM_WORLD, reqlist+2);
	MPI_Recv_init(rr, dim1, MPI_DOUBLE, rrank, tag, 
		      MPI_COMM_WORLD, reqlist+3);
}

Jacobi2D::~Jacobi2D(){
	assrt(gl_mpi_onoff == MPION);
	MPI_Request_free(reqlist+0);
	MPI_Request_free(reqlist+1);
	MPI_Request_free(reqlist+2);
	MPI_Request_free(reqlist+3);
	delete[] a;
	delete[] b;
	delete[] al;
	delete[] ar;
	delete[] bl;
	delete[] br;
	delete[] ll;
	delete[] rr;
}

void Jacobi2D::initialize(int col1, int col2){//chessboard pattern
	for(int j=col1; j < col2; j++)
		for(int i=0; i < dim1; i++){
			a[i+j*dim1] = ((i+j)%2==0)?1:-1;
			b[i+j*dim1] = 0;
		}
	if(col1 == 0)
		for(int i = 0; i < dim1; i++){
			al[i] = ((i+1)%2==0)?1:-1;
			ar[i] = (i%2==0)?1:-1;
			bl[i] = 0;
			br[i] = 0;
		}
}

void Jacobi2D::initializepp(){
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)					
	{
		int tid = omp_get_thread_num();
		int col1 = tid*dim2/nthreads;
		int col2 = (tid+1)*dim2/nthreads;
		this->initialize(col1, col2);
	}
}

void Jacobi2D::postsendrecv(){
	MPI_Startall(4, reqlist);
}

void Jacobi2D::wait(){
	MPI_Waitall(4, reqlist, MPI_STATUSES_IGNORE);
}

void Jacobi2D::updateinterior(int col1, int col2){
	if(col1 == 0){
		int j = 0;
		for(int i=0; i < dim1; i++){
			int iup = (i==0)?(dim1-1):i-1;
			int idown = (i==dim1-1)?0:i+1;
			b[i+j*dim1] = 0.25*(a[iup+j*dim1]+a[idown+j*dim1]
					    +al[i]+a[i+(j+1)*dim1]);
		}
		col1++;
	}
	if(col2==dim2){
		int j = dim2-1; 
		for(int i=0; i < dim1; i++){
			int iup = (i==0)?(dim1-1):i-1;
			int idown = (i==dim1-1)?0:i+1;
			b[i+j*dim1] = 0.25*(a[iup+j*dim1]+a[idown+j*dim1]
					    +a[i+(j-1)*dim1]+ar[i]);
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
	num_threads(nthreads)			\
	default(none)					
	{
		int tid = omp_get_thread_num();
		int col1 = tid*dim2/nthreads;
		int col2 = (tid+1)*dim2/nthreads;
		this->updateinterior(col1, col2);
  }
}

void Jacobi2D::updateboundary(){
	for(int i=0; i < dim1; i++){
		int iup = (i==0)?(dim1-1):i-1;
		int idown = (i==dim1-1)?0:i+1;
		bl[i] = 0.25*(al[iup]+al[idown]+ll[i]+a[i]);
		br[i] = 0.25*(ar[iup]+ar[idown]+
				  a[i+(dim2-1)*dim1]+rr[i]);
	}
}

void Jacobi2D::copy(int col1, int col2){
	for(int j=col1; j < col2; j++)
		for(int i=0; i < dim1; i++)
			a[i+j*dim1] = b[i+j*dim1];
	if(col1 == 0)
		for(int i=0; i < dim1; i++){
			al[i] = bl[i];
			ar[i] = br[i];
		}
}

void Jacobi2D::copypp(){
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(none)					
	{
		int tid = omp_get_thread_num();
		int col1 = tid*dim2/nthreads;
		int col2 = (tid+1)*dim2/nthreads;
		this->copy(col1, col2);
	}
}
