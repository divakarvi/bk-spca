#include "../utils/utils.hh"
#include "cycle.hh"
#include <mpi.h>


#define USEMPIALLOCMEM

Cycle::Cycle(int rank, int nprocs, int bsize)
	:sreq1(reqlist[0]), sreq2(reqlist[1]), 
	 rreq1(reqlist[2]), rreq2(reqlist[3])
{
	assrt(bsize > 0);
	bufsize = bsize;

#ifdef USEMPIALLOCMEM
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&sendbufl));
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&recvbufl));
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&sendbufr));
	MPI_Alloc_mem(bufsize*8, MPI_INFO_NULL, (void *)(&recvbufr));
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
		      MPI_COMM_WORLD, &sreq1);
	MPI_Send_init(sendbufr, bufsize, MPI_DOUBLE, right, tagr, 
		      MPI_COMM_WORLD, &sreq2);
	MPI_Recv_init(recvbufl, bufsize, MPI_DOUBLE, left, tagr, 
		      MPI_COMM_WORLD, &rreq1);
	MPI_Recv_init(recvbufr, bufsize, MPI_DOUBLE, right, tagl, 
		      MPI_COMM_WORLD, &rreq2);
}

Cycle::~Cycle(){
#ifdef USEMPIALLOCMEM
	MPI_Free_mem(sendbufl);
	MPI_Free_mem(recvbufl);
	MPI_Free_mem(sendbufr);
	MPI_Free_mem(recvbufr);
#else
	delete[] sendbufl;
	delete[] sendbufr;
	delete[] recvbufl;
	delete[] recvbufr;
#endif
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
