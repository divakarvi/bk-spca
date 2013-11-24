#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../mpi-init/mpi_init.hh"
#include "timer.hh"
#include "trans.hh"
#include <mpi.h>
#include <omp.h>

Transpose::Transpose(int rank, int nprocs, long Mi, long Ni)
	:p(rank), P(nprocs), M(Mi), N(Ni)
{    
	fstM = new long[P+1];
	fstN = new long[P+1];
	BlockDivide(M, P, fstM);
	BlockDivide(N, P, fstN);
	long ncols = fstN[p+1]-fstN[p];
	long nrows = fstM[p+1]-fstM[p];

	assrt(ncols > 0);
	sendbuf = new double[ncols*M];
	/*
	 * MPI_Alloc_mem() inhibits  numa optimization
	 * uncomment (and comment above) to verify
	 */
	//MPI_Alloc_mem(8*ncols*M, MPI_INFO_NULL, (void *)(&sendbuf));
	

	assrt(nrows > 0);
	recvbuf = new double[nrows*N];
	/*
	 * MPI_Alloc_mem() inhibits  numa optimization
	 * uncomment (and comment above) to verify
	 */
	//MPI_Alloc_mem(8*nrows*N, MPI_INFO_NULL, (void *)(&recvbuf));

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

/*
 * block size
 */
#define B 50

#ifdef OMPCPY

void transposewlda(double *in, int lda, long nrows, long ncols, double *out){
#pragma omp parallel for			\
	num_threads(NTHREADS)			\
	default(none)				\
	shared(in, lda, nrows, ncols, out)
	for(int i=0; i < nrows; i+=B)
		for(int j=0; j < ncols; j+=B){
			int iib = (nrows-i < B)?nrows-i:B;
			int jjb = (ncols-j < B)?ncols-j:B;
			for(int ii=0; ii < iib;ii++)
				for(int jj=0; jj < jjb;jj++)
					out[j+jj+(i+ii)*ncols] 
						= in[i+ii+(j+jj)*lda];
		}
}
#else

void transposewlda(double *in, int lda, long nrows, long ncols, double *out){
	for(long i=0; i < nrows; i++)
		for(long j=0; j < ncols; j++)
			out[j+i*ncols] = in[i+j*lda];
}

#endif

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
	for(long q=0; q < P; q++)
		MPI_Wait(sreqlist+q, MPI_STATUS_IGNORE);
	for(long q=0; q < P; q++)
		MPI_Wait(rreqlist+q, MPI_STATUS_IGNORE);
}

#ifdef OMPCPY

void copywlda(double *in, int nrows, int ncols, double *out, int lda){
#pragma omp parallel for			\
	num_threads(NTHREADS)			\
	default(none)				\
	shared(in, nrows, ncols, out, lda)
	for(long j=0; j < ncols; j++)
		for(long i=0; i < nrows; i++)
			out[i+j*lda] = in[i+j*nrows];
}

#else

void copywlda(double *in, int nrows, int ncols, double *out, int lda){
	for(long j=0; j < ncols; j++)
		for(long i=0; i < nrows; i++)
			out[i+j*lda] = in[i+j*nrows];
}

#endif

void Transpose::copyFROMrecvbuf(double *localNM){
	long ncols = fstM[p+1]-fstM[p];
	for(long q=0; q < P; q++){
		long nrows = fstN[q+1]-fstN[q];
		long rbufindex = ncols*fstN[q];
		long localindx = fstN[q];
		long lda = N;
		copywlda(recvbuf+rbufindex, nrows, ncols, 
			 localNM+localindx, lda);
	}
}

void Transpose::transpose(double *localMN, double *localNM){
	TimeStamp clk;
	
	clk.tic();
	copyTOsendbuf(localMN);
	trans_timer.scopy += clk.toc();

	clk.tic();
	postsend();
	postrecv();
	wait();
	trans_timer.mpi += clk.toc();

	clk.tic();
	copyFROMrecvbuf(localNM);
	trans_timer.rcopy += clk.toc();
}
