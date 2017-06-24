#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../init/mpi_init.hh"
#include "timer.hh"
#include "trans.hh"
#include "fast_trans.hh"
#include <mpi.h>
#include <omp.h>

//fast_trans.hh.
FastTrans::FastTrans(int rank, int nprocs, long Mi, long Ni)
	:p(rank), P(nprocs), M(Mi), N(Ni)
{    
	NTHREADS = dv_omp_nthreads();
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

	/*
	 * transpose() relies on requests getting set to MPI_REQUEST_NULL
	 * after MPI_Testany().
	 * Therefore, persistent recvs are not feasible with current design.
	 */
	sreqlist = new MPI_Request[P];
	rreqlist = new MPI_Request[P];

	sendorder = new int[P];
	rcvd_list = new int[P];
	
	sendorder[0] = 0;
	for(int i=1; i < P/2 + P%2; i++){
		sendorder[2*(i-1)+1] = i;
		sendorder[2*(i-1)+2] = P-i;
	}
	if(P%2 == 0)
		sendorder[P-1] = P/2;
	
	for(int i=0; i < P; i++)
		sendorder[i] = (sendorder[i]+p)%P;
	
	/*
	 * Reverses sendorder[].
	 */
	for(int i=0, j=P-1; i < j; i++, j--){
		int tmp = sendorder[i];
		sendorder[i] = sendorder[j];
		sendorder[j] = tmp;
	}
}

FastTrans::~FastTrans(){
	delete[] fstM;
	delete[] fstN;
	delete[] sreqlist;
	delete[] rreqlist;
	delete[] sendbuf;
	delete[] recvbuf;
	delete[] sendorder;
	delete[] rcvd_list;
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
	int count = ncols*nrows; //MPI can't handle long.
	int tag = 0;
	MPI_Isend(sendbuf+sbufindex, count, MPI_DOUBLE,
		  q, tag, MPI_COMM_WORLD, sreqlist+q);

	double cycles = clk.toc();
	trans_timer.mpi_send_post += cycles;
	trans_timer.mpi += cycles;
       
}

void FastTrans::postrecv(int q){
	TimeStamp clk;
	clk.tic();

	long ncols = fstM[p+1]-fstM[p];
	long nrows = fstN[q+1]-fstN[q];
	long rbufindex = ncols*fstN[q];
	int count = nrows*ncols;//MPI can't handle long.
	int tag = 0;
	MPI_Irecv(recvbuf+rbufindex, count, MPI_DOUBLE, 
		  q, tag, MPI_COMM_WORLD, rreqlist+q);
	
	double cycles = clk.toc();
	trans_timer.mpi_recv_post += cycles;
	trans_timer.mpi += cycles;
}

void FastTrans::wait(){
	TimeStamp clk;
	clk.tic();

	MPI_Waitall(P, sreqlist, MPI_STATUSES_IGNORE);
	
	double cycles = clk.toc();
	trans_timer.mpi_send_wait += cycles;
	trans_timer.mpi += cycles;
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

/*
 * MPI_Testany() here relies on requests getting set to MPI_REQUEST_NULL.
 * Therefore, persistent recvs are not feasible in this design.
 */
void FastTrans::transpose(double *localMN, double *localNM){
	for(int q=0; q < P; q++)
		postrecv(q);

	int nrcvd = 0;
	for(int i=0; i < P; i++){
		int q = sendorder[i];
		copyTOsendbuf(q, localMN);
		postsend(q);
		int flag;
		MPI_Testany(P, rreqlist, &q, &flag, 
			    MPI_STATUS_IGNORE);
		if(flag != 0){
			rcvd_list[nrcvd] = q;
			nrcvd++;
		}
	}
	
	int ncpyd = 0;
	while(nrcvd < P){
		if(ncpyd < nrcvd){
			int q = rcvd_list[ncpyd];
			copyFROMrecvbuf(q, localNM);
			ncpyd++;
		}
		
		int q;
		int flag;
		MPI_Testany(P, rreqlist, &q, &flag, MPI_STATUS_IGNORE);
		if(flag != 0){
			rcvd_list[nrcvd] = q;
			nrcvd++;
		}
	}

	assrt(nrcvd == P);
	
	while(ncpyd < P){
		int q = rcvd_list[ncpyd];
		copyFROMrecvbuf(q, localNM);
		ncpyd++;
	}

	wait(); // Verifies sending is finished.
}

