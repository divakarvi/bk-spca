#include "../../utils/utils.hh"
#include "../init/mpi_init.hh"
#include "exchange.hh"
#include <mpi.h>

void exchange_blocking(int rank, int nprocs, 
			 double* sendbuf, double* recvbuf, 
			 int n){
	int tag = 0;
	assrt(nprocs == 2);
	if(rank==0){
		MPI_Send(sendbuf, n, MPI_DOUBLE, nprocs-1, tag,
			 MPI_COMM_WORLD);
		MPI_Recv(recvbuf, n, MPI_DOUBLE, nprocs-1, tag, 
			 MPI_COMM_WORLD,
			 MPI_STATUS_IGNORE);
	}
	else if(rank==nprocs-1){
		MPI_Recv(recvbuf, n, MPI_DOUBLE, 0, tag, 
			 MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		MPI_Send(sendbuf, n, MPI_DOUBLE, 0, tag,
			 MPI_COMM_WORLD);
	}
}

void exchange_nonblocking(int rank, int nprocs, 
			  double* sendbuf, double* recvbuf, 
			  int n){
	int tag = 0;
	MPI_Request req1, req2;
	int destn = (rank==0)?nprocs-1:0;
	MPI_Isend(sendbuf, n, MPI_DOUBLE, destn, tag, 
		  MPI_COMM_WORLD, &req1);
	MPI_Irecv(recvbuf, n, MPI_DOUBLE, destn, tag, 
		  MPI_COMM_WORLD, &req2);
	MPI_Wait(&req1, MPI_STATUS_IGNORE); 
	MPI_Wait(&req2, MPI_STATUS_IGNORE);
}

Exchg::Exchg(int rank, int nprocs, int bsize){
	assrt(nprocs==2);
	assrt(gl_mpi_onoff == MPION);
	bufsize = bsize;
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, &sendbuf);
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, &recvbuf);
	int tag = 0;
	if(rank==0){
		MPI_Send_init(sendbuf, bufsize, MPI_DOUBLE, nprocs-1, tag, 
			      MPI_COMM_WORLD, &req1);
		MPI_Recv_init(recvbuf, bufsize, MPI_DOUBLE, nprocs-1, tag, 
			      MPI_COMM_WORLD, &req2);
	}
	else if(rank==nprocs-1){
		MPI_Send_init(sendbuf, bufsize, MPI_DOUBLE, 0, tag, 
			      MPI_COMM_WORLD, &req1);
		MPI_Recv_init(recvbuf, bufsize, MPI_DOUBLE, 0, tag, 
			      MPI_COMM_WORLD, &req2);
	}
}

Exchg::~Exchg(){
	assrt(gl_mpi_onoff == MPION);
	MPI_Free_mem(sendbuf);
	MPI_Free_mem(recvbuf);
	MPI_Request_free(&req1);
	MPI_Request_free(&req2);
}

void Exchg::post(){
	MPI_Start(&req1);
	MPI_Start(&req2);
}

void Exchg::wait(){
	MPI_Wait(&req1, MPI_STATUS_IGNORE);
	MPI_Wait(&req2, MPI_STATUS_IGNORE);
}

