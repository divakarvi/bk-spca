#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/Table.hh"
#include "../init/mpi_init.hh"
#include "cycle.hh"

/*
 * returns median number of cycles for cycling with n doubles = 8n bytes
 */
double time(int rank, int nprocs, int n){
	Cycle cycle(rank, nprocs, n);
	int count = 5l*1000*1000*100/n;
 
	StatVector stats(count);
	TimeStamp clk;

	double *lbuf = cycle.lsbuf();
	double *rbuf = cycle.rsbuf();
	for(int i=0; i < n; i++){
		lbuf[i] = -1.0*(rank+1)*(rank+1);
		rbuf[i] =  1.0*(rank+1)*(rank+1);
	}
	
	for(int i=0; i < count; i++){
		clk.tic();
		cycle.post();
		cycle.wait();
		double cycles = clk.toc();
		stats.insert(cycles);
		cycle.copy_r2s();
	}
	
	return stats.median();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	mpi_print_name(rank);

	const char *rows[6] = {"1e3", "1e4", "1e5", 
			       "1e6", "1e7", "1e8"};
	int nlist[6] = {1000, 1000*10, 1000*100, 
			1000*1000, 1000*1000*10, 1000*1000*100};
	const char* cols[2] = {"cycles", "b/w"};
	double data[12];
	
	for(int i=0; i < 6; i++){
		data[i] = time(rank, nprocs, nlist[i]);
		data[i+6] = 32.0*nlist[i]/data[i];
	}

	if(rank == 0){//output table
		char fname[200];
		verify_dir("DBG");
		sprintf(fname, "DBG/time_cycle_NP%d.txt", nprocs);
		link_cout(fname);

		Table tbl;
		tbl.dim(6, 2);
		tbl.rows(rows);
		tbl.cols(cols);
		tbl.data(data);
		tbl.print();

		unlink_cout();
	}
			
	mpi_finalize();
}
