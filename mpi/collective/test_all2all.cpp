#include "../../utils/utils.hh"
#include "../init/mpi_init.hh"
#include "all2all.hh"

void test(int rank, int nprocs){
	verify_dir("DBG");
	char fname[200];
	sprintf(fname, "DBG/test%d.txt", rank);
	link_cout(fname);

	double *sendbuf = new double[nprocs];
	double *recvbuf = new double[nprocs];
	
	for(int i=0; i < nprocs; i++)
		sendbuf[i] = rank;

	mpi_all2all(rank, nprocs, sendbuf, recvbuf, 1);
	array_show(recvbuf, nprocs, "mpi all2all");
	
	array_diff(recvbuf, recvbuf, nprocs);

	scatter_all2all(rank, nprocs, sendbuf, recvbuf, 1);
	array_show(recvbuf, nprocs, "scatter all2all");

	array_diff(recvbuf, recvbuf, nprocs);

	MPI_Request *reqlist;
	reqlist = all2all_init(rank, nprocs, sendbuf, recvbuf, 1);
	all2all(rank, nprocs, reqlist);
	all2all_finalize(reqlist);
	array_show(recvbuf, nprocs, "send/recv all2all");

	delete[] sendbuf;
	delete[] recvbuf;
	unlink_cout();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);

	test(rank, nprocs);

	mpi_finalize();
}

