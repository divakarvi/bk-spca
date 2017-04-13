#include "../../utils/utils.hh"
#include "../init/mpi_init.hh"
#include "jacobi.hh"
#include <mpi.h>
#include <omp.h>


Jacobi2D::Jacobi2D(int rank, int nprocs, int d1, int d2, int nth){
	nthreads = nth;
	dim1 = d1;
	dim2 = d2;
	assrt(dim1%2 == 0);
	assrt(dim2%2 == 0);

	a = new double[dim1*(dim2+2)];
	b = new double[dim1*(dim2+2)];

	lrank = (rank==0)?nprocs-1:rank-1;
	rrank = (rank==nprocs-1)?0:rank+1;

	int tag = 0;
	double *left = a;
	double *al = a + dim1;
	double *ar = a + dim1*dim2;
	double *right = a + dim1*(dim2+1);
	MPI_Send_init(al, dim1, MPI_DOUBLE, lrank, tag, 
		      MPI_COMM_WORLD, reqlist+0);
	MPI_Send_init(ar, dim1, MPI_DOUBLE, rrank, tag, 
		      MPI_COMM_WORLD, reqlist+1);
	MPI_Recv_init(left, dim1, MPI_DOUBLE, lrank, tag, 
		      MPI_COMM_WORLD, reqlist+2);
	MPI_Recv_init(right, dim1, MPI_DOUBLE, rrank, tag, 
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
}

void Jacobi2D::initialize(int col1, int col2){//chessboard pattern
	for(int j=col1+1; j < col2+1; j++)
		for(int i=0; i < dim1; i++){
			a[i+j*dim1] = ((i+j-1)%2==0)?1:-1;
			b[i+j*dim1] = 0;
		}
}

void Jacobi2D::initializepp(){
	/*
	 * omp does not see the class members dim2, nthreads
	 * default(shared) + shared(dim2, nthreads) gives compilation error
	 * way to get around 
	 * --Jacobi2D *self = this;
	 * --shared(this)
	 * --self->dim2, self->nthreads
	 * is a bit too clumsy
	 */ 
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(shared)				
	{
		int tid = omp_get_thread_num();
		int col1 = tid*dim2/nthreads;
		int col2 = (tid+1)*dim2/nthreads;
		initialize(col1, col2);
	}
}

void Jacobi2D::postsendrecv(){
	MPI_Startall(4, reqlist);
}

void Jacobi2D::wait(){
	MPI_Waitall(4, reqlist, MPI_STATUSES_IGNORE);
}

void Jacobi2D::update(int col1, int col2){
	for(int j=col1+1; j < col2+1; j++)
		for(int i=0; i < dim1; i++){
			int iup = (i+dim1-1)%dim1;
			int idown = (i+1)%dim1;
			b[i+j*dim1] = 0.25*(a[iup+j*dim1]
					    + a[idown+j*dim1]
					    + a[i+(j-1)*dim1]
					    + a[i+(j+1)*dim1]);
		}
}

void Jacobi2D::updatepp(){
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(shared)				
	{
		int tid = omp_get_thread_num();
		int col1 = tid*dim2/nthreads;
		int col2 = (tid+1)*dim2/nthreads;
		update(col1, col2);
	}
}

void Jacobi2D::copy(int col1, int col2){
	for(int j=col1+1; j < col2+1; j++)
		for(int i=0; i < dim1; i++)
			a[i+j*dim1] = b[i+j*dim1];
}

void Jacobi2D::copypp(){
#pragma omp parallel				\
	num_threads(nthreads)			\
	default(shared)				
	{
		int tid = omp_get_thread_num();
		int col1 = tid*dim2/nthreads;
		int col2 = (tid+1)*dim2/nthreads;
		this->copy(col1, col2);
	}
}

