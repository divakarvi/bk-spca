#include "../utils/utils.hh"
#include "cycle.hh"
#include <mpi.h>


#define USEMPIALLOCMEM

Cycle::Cycle(int rank, int nprocs, int bsize)
{
	assrt(bsize > 0);
	bufsize = bsize;
	
#ifdef USEMPIALLOCMEM
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, &sendbufl);
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, &recvbufl);
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, &sendbufr);
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, &recvbufr);
#else
	sendbufl = new double[bufsize];
	sendbufr = new double[bufsize];
	recvbufl = new double[bufsize];
	recvbufr = new double[bufsize];
#endif
	int left = (rank==0)?nprocs-1:rank-1;
	int right = (rank==nprocs-1)?0:rank+1;
	int tagl = 0;
	int tagr = 1;
	MPI_Send_init(sendbufl, bufsize, MPI_DOUBLE, left, tagl, 
		      MPI_COMM_WORLD, reqlist+0);
	MPI_Send_init(sendbufr, bufsize, MPI_DOUBLE, right, tagr, 
		      MPI_COMM_WORLD, reqlist+1);
	MPI_Recv_init(recvbufl, bufsize, MPI_DOUBLE, left, tagr, 
		      MPI_COMM_WORLD, reqlist+2);
	MPI_Recv_init(recvbufr, bufsize, MPI_DOUBLE, right, tagl, 
	MPI_COMM_WORLD, reqlist+3);
}

Cycle::~Cycle(){
	
#ifdef USEMPIALLOCMEM
	//MPI_Free_mem(sendbufl);
	//MPI_Free_mem(recvbufl);
	//MPI_Free_mem(sendbufr);
	//MPI_Free_mem(recvbufr);
#else
	delete[] sendbufl;
	delete[] sendbufr;
	delete[] recvbufl;
	delete[] recvbufr;
#endif
	
	for(int i=0; i < 4; i++)
		MPI_Request_free(reqlist+i);
}

void Cycle::post(){
	MPI_Startall(4, reqlist);
}

void Cycle::wait(){
	MPI_Waitall(4, reqlist, MPI_STATUSES_IGNORE);
}

void Cycle::copy_r2s(){
	for(int i=0; i < bufsize; i++){
		sendbufr[i] = recvbufl[i];
		sendbufl[i] = recvbufr[i];
	}
}
