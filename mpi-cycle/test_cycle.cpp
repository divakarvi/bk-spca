#include "../utils/utils.hh"
#include "../mpi-intro/mpi_utils.hh"
#include "cycle.hh"

/*
 * left sendbuf -ve
 * right sendbuf +ve
 */
void init_sbuf(Cycle& cycle, int rank, int bufsize){
	double *buf = cycle.lsbuf();
	for(int i=0; i <  bufsize; i++)
		buf[i] = -(rank+1);
	
	buf = cycle.rsbuf();
	for(int i=0; i < bufsize; i++)
		buf[i] = (rank+1);
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	
	char fname[200];
	verify_dir("DBG");
	sprintf(fname, "DBG/test_cycle_P%d", rank);
	link_cout(fname);

	int bufsize = 10;
	Cycle cycle(rank, nprocs, bufsize);
	
	init_sbuf(cycle, rank, bufsize);
	double *buf = cycle.lsbuf();
	array_show(buf, bufsize, "init lsendbuf:");
	buf = cycle.rsbuf();
	array_show(buf, bufsize, "init rsendbuf:");
	
	for(int i=0; i < 100*nprocs+1; i++){
		cycle.post();
		cycle.wait();
		cycle.copy_r2s();
	}

	buf = cycle.lsbuf();
	array_show(buf, bufsize, "final lsendbuf:");
	buf = cycle.rsbuf();
	array_show(buf, bufsize, "final rsendbuf:");

	unlink_cout();
	
	MPI_Finalize();
}
