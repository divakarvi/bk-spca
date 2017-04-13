#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "all2all.hh"
#include <mpi.h>

double mpi_all2all(int rank, int nprocs, 
		       double *sendbuf, double *recvbuf, int n){
	TimeStamp clk;
	clk.tic();
	MPI_Alltoall(sendbuf, n, MPI_DOUBLE, recvbuf, n, MPI_DOUBLE,
		     MPI_COMM_WORLD);
	double cycles = clk.toc();
	return cycles;
}

double scatter_all2all(int rank, int nprocs, 
		       double *sendbuf, double *recvbuf, int n){
	TimeStamp clk;
	clk.tic();
	for(int root=0; root < nprocs; root++)
		MPI_Scatter(sendbuf, n, MPI_DOUBLE, 
			    recvbuf+n*root,n,MPI_DOUBLE, 
			    root,MPI_COMM_WORLD);
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

