#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../mpi-init/mpi_init.hh"
#include "timer.hh"
#include "trans.hh"
#include "fast_trans.hh"
#include <mpi.h>
#include <omp.h>

FastTrans::FastTrans(int rank, int nprocs, long Mi, long Ni)
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

	assrt(nrows > 0);
	recvbuf = new double[nrows*N];

	sreqlist = new MPI_Request[P];
	rreqlist = new MPI_Request[P];

	sendorder = new int[P];
	recvorder = new int[P];
	
	sendorder[0] = 0;
	recvorder[0] = 0;
	for(int i=1; i < P/2 + P%2; i++){
		sendorder[2*(i-1)+1] = i;
		sendorder[2*(i-1)+2] = P-i;
		
		recvorder[2*(i-1)+1] = P-i;
		recvorder[2*(i-1)+2] = i;
	}
	if(P%2 == 0){
		sendorder[P-1] = P/2;
		recvorder[P-1] = P/2;
	}
	
	for(int i=0; i < P; i++){
		sendorder[i] = (sendorder[i]+p)%P;
		recvorder[i] = (recvorder[i]+p)%P;
	}
}

FastTrans::~FastTrans(){
	delete[] fstM;
	delete[] fstN;
	delete[] sreqlist;
	delete[] rreqlist;
	if(fstN[p+1]*M>fstN[p]*M)
		delete[] sendbuf;

	if(fstM[p+1]*N>fstM[p]*N)
		delete[] recvbuf;

	delete[] sendorder;
	delete[] recvorder;
}

void FastTrans::copyTOsendbuf(int q, double *localMN){
	TimeStamp clk;
	clk.tic();

	long ncols = fstN[p+1] - fstN[p];
	long nrows = fstM[q+1] - fstM[q];
	long sbufindex = ncols * fstM[q];
	long localindex = fstM[q];
	long lda = M;
	transposewlda(localMN+localindex, lda, 
		      nrows, ncols, 
		      sendbuf+sbufindex);

	trans_timer.scopy += clk.toc();
}

void FastTrans::postsend(int q){
	TimeStamp clk;
	clk.tic();

	long ncols = fstN[p+1]-fstN[p];
	long nrows = fstM[q+1]-fstM[q];
	long sbufindex = ncols*fstM[q];
	int count = ncols*nrows; //MPI can't handle long
	int tag = 0;
	MPI_Isend(sendbuf+sbufindex, count, MPI_DOUBLE,
		  q, tag, MPI_COMM_WORLD, sreqlist+q);

	//trans_timer.mpi += clk.toc();
}

void FastTrans::postrecv(int q){
	TimeStamp clk;
	clk.tic();

	long ncols = fstM[p+1]-fstM[p];
	long nrows = fstN[q+1]-fstN[q];
	long rbufindex = ncols*fstN[q];
	int count = nrows*ncols;//MPI can't handle long
	int tag = 0;
	MPI_Irecv(recvbuf+rbufindex, count, MPI_DOUBLE, 
		  q, tag, MPI_COMM_WORLD, rreqlist+q);
	
	trans_timer.mpi += clk.toc();
}



void FastTrans::wait(int q){
	TimeStamp clk;
	clk.tic();

	MPI_Wait(rreqlist+q, MPI_STATUS_IGNORE);
	
	//trans_timer.mpi += clk.toc();
}

void FastTrans::wait(){
	TimeStamp clk;
	clk.tic();

	MPI_Waitall(P, sreqlist, MPI_STATUSES_IGNORE);
	
	//trans_timer.mpi += clk.toc();
}

void FastTrans::copyFROMrecvbuf(int q, double *localNM){
	TimeStamp clk;
	clk.tic();

	long ncols = fstM[p+1]-fstM[p];
	long nrows = fstN[q+1]-fstN[q];
	long rbufindex = ncols*fstN[q];
	long localindx = fstN[q];
	long lda = N;
	copywlda(recvbuf+rbufindex, nrows, ncols, 
		 localNM+localindx, lda);

	trans_timer.rcopy += clk.toc();
}

void FastTrans::transpose(double *localMN, double *localNM){
	for(int i=0; i < P; i++){
		int q = sendorder[i];
		copyTOsendbuf(q, localMN);
		postsend(q);
		q = recvorder[i];
		postrecv(q);
	}

	for(int i=0; i < P; i++){		
		int q = recvorder[i];
		wait(q);
		copyFROMrecvbuf(q, localNM);
	}
	
	wait(); /* verify sending is finished */
}
