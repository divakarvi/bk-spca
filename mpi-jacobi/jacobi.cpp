#include "../utils/utils.hh"
#include "jacobi.hh"
#include <mpi.h>
#include <omp.h>


Jacobi2D::Jacobi2D(int d1, int d2, int rank, int nprocs, int nth){
	nthreads = nth;
	dim1 = d1;
	dim2 = d2;
	assrt(dim1%2 == 0);
	assrt(dim2%nthreads == 0);
	assrt(nthreads%2 == 0);

	a = new double[dim1*dim2];
	b = new double[dim1*dim2];

	MPI_Alloc_mem(4*dim1*8, MPI_INFO_NULL, &left);
	lleft = left+dim1;
	right = left+2*dim1;
	rright = left+3*dim1;

	bleft = new double[dim1];
	bright = new double[dim1];

	lrank = (rank==0)?nprocs-1:rank-1;
	rrank = (rank==nprocs-1)?0:rank+1;

	int tag = 0;
	MPI_Send_init(left, dim1, MPI_DOUBLE, lrank, tag, 
		      MPI_COMM_WORLD, reqlist+0);
	MPI_Send_init(right, dim1, MPI_DOUBLE, rrank, tag, 
		      MPI_COMM_WORLD, reqlist+1);
	MPI_Recv_init(lleft, dim1, MPI_DOUBLE, lrank, tag, 
		      MPI_COMM_WORLD, reqlist+2);
	MPI_Recv_init(rright, dim1, MPI_DOUBLE, rrank, tag, 
		      MPI_COMM_WORLD, reqlist+3);
}

Jacobi2D::~Jacobi2D(){
	MPI_Free_mem(left);
	MPI_Request_free(reqlist+0);
	MPI_Request_free(reqlist+1);
	MPI_Request_free(reqlist+2);
	MPI_Request_free(reqlist+3);
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
	num_threads(nthreads)			\
	default(none)					
	{
		int tid = omp_get_thread_num();
		int col1 = tid*dim2/nthreads;
		int col2 = (tid+1)*dim2/nthreads;
		this->copy(col1, col2);
	}
}
