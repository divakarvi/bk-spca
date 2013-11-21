#include "../utils/utils.hh"
#include "../utils/Table.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../mpi-intro/mpi_utils.hh"
#include "exchange.hh"
#include <cstdlib>


enum exchange_type {BLCK, NONBLCK, PSTNT};
struct time_args_struct{
	int rank;
	int nprocs;
	int n;
	int count;
};

void time(struct time_args_struct args, enum exchange_type flag,
	  StatVector&  stats){
	int rank = args.rank;
	int nprocs = args.nprocs;
	int n = args.n;
	int count = args.count;

	assrt(count <= stats.getSize());
	stats.flush();

	double* sendbuf;
	double* recvbuf;
	sendbuf = new double[n];
	recvbuf = new double[n];
	for(int i=0; i < n; i++)
		sendbuf[i] = rank+1;

	
	Exchg xchg(rank, nprocs, n);
	double *sbuf = xchg.getsbuf();
	for(int i=0; i < n; i++)
		sbuf[i] = (rank+1)*10;


	TimeStamp clk;
	for(int i=0; i < count; i++){
		clk.tic();
		switch(flag){
		case BLCK:
			exchange_blocking(rank, nprocs, 
						   sendbuf, recvbuf, n);
			break;
		case NONBLCK:
			exchange_blocking(rank, nprocs, 
						   sendbuf, recvbuf, n);
			break;
		case PSTNT:
			xchg.post();
			xchg.wait();
			break;
		}
		double cycles = clk.toc();
		stats.insert(cycles);
	}

	delete[] sendbuf;
	delete[] recvbuf;
}

void make_table(int rank, int nprocs){
	int nlist[7] = {100, 1000, 10000, 100000, 1000*1000, 1000*1000*10,
			1000*1000*100};
	const char *cols[7] = {"800", "8 KB", "80 KB", "800 KB",
			       "8 MB", "80 MB", "800 MB"};
	const char *rows[12] = {"blck,min", "blck,mid", "blck,max", "blck,bw"
				"nblk,min", "nblk,mid", "nblk,max","nblk,bw",
				"pstt,min", "pstt,mid", "pstt,max","pstt,nw"};

	double data[12*7];

	for(int i=0; i < 7; i++){
		time_args_struct args;
		args.rank = rank;
		args.nprocs = nprocs;
		args.n = nlist[i];
		args.count = 1l*1000*1000*1000/args.n;
		StatVector stats(args.count);
		
		time(args, BLCK, stats);
		data[12*i] = stats.min();
		data[12*i+1] = stats.median();
		data[12*i+2] = stats.max();
		data[12*i+3] = 16.0*args.n/stats.median();

		time(args, NONBLCK, stats);
		data[12*i+4] = stats.min();
		data[12*i+5] = stats.median();
		data[12*i+6] = stats.max();
		data[12*i+7] = 16.0*args.n/stats.median();
		
		time(args, PSTNT, stats);
		data[12*i+8] = stats.min();
		data[12*i+9] = stats.median();
		data[12*i+10] = stats.max();
		data[12*i+11] = 16.0*args.n/stats.median();
	}

	Table tbl;
	tbl.dim(12, 7);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("min/median/max in cycles, bw in bytes/cycle"); 
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	assrt(nprocs == 2);

	verify_dir("DBG");
	char fname[200];
	sprintf(fname, "DBG/time_xchg_P%d.txt", rank);
	link_cout(fname);

	make_table(rank, nprocs);

	unlink_cout();
	
	MPI_Finalize();
}
