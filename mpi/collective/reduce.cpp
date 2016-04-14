#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "reduce.hh"
#include <mpi.h>

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

void minimize(double *recvbuf, double *scratch, int bufsize){
	for(int j=0; j < bufsize; j++)
		if(recvbuf[j]<scratch[j])
			scratch[j] = recvbuf[j];
}

double reducemin_tree(int rank, int nprocs,
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
				MPI_Irecv(recvbuf, bufsize, MPI_DOUBLE, 
					  source, i,
					  MPI_COMM_WORLD, &req);
				MPI_Wait(&req, MPI_STATUS_IGNORE);
				minimize(recvbuf, scratch, bufsize);
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
