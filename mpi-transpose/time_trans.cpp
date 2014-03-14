/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../mpi-init/mpi_init.hh"
#include "timer.hh"
#include "trans.hh"
#include "fast_trans.hh"
#include <fstream>
#include <cstdio>

struct trans_stat_cycles_struct{ /*cycles per byte */
	double mpi;
	double send_post;
	double recv_post;
	double send_wait;
	double recv_wait;
	double scopy;
	double rcopy;
};

struct trans_stat_struct{
	double frac_scopy;
	double frac_mpi;
	double frac_rcopy;
	double bw; 
	struct trans_stat_cycles_struct cycles;
};

struct trans_stat_struct time_trans(int rank, int nprocs, int M, int N){
	int count = 20;
	StatVector stats(count);
	StatVector stats_scopy(count), stats_mpi(count), stats_rcopy(count);

	double *localMN;
	double *localNM;
#ifndef FTRANS
	Transpose transmn(rank, nprocs, M, N);
	Transpose transnm(rank, nprocs, N, M);
#else
	FastTrans transmn(rank, nprocs, M, N);
	FastTrans transnm(rank, nprocs, N, M);
#endif
	int localm = transmn.ffstM(rank+1)-transmn.ffstM(rank);
	int localn = transmn.ffstN(rank+1)-transmn.ffstN(rank);
	localMN = new double[M*localn];
	localNM = new double[localm*N];
	
	transmn.transpose(localMN, localNM);//numa awareness
	transnm.transpose(localNM, localMN);
	fflush(stdout);

	for(long i=0; i < M*localn; i++)
		localMN[i] = rand()*1.0/RAND_MAX-0.5;

	for(int i=0; i < count; i++){
		TimeStamp clk;
		zero_trans_timer();
		clk.tic();

		transmn.transpose(localMN, localNM);
		transnm.transpose(localNM, localMN);
		fflush(stdout);

		stats.insert(clk.toc());
		stats_scopy.insert(trans_timer.scopy);
		stats_mpi.insert(trans_timer.mpi);
		stats_rcopy.insert(trans_timer.rcopy);
	}
	
	delete[] localMN;
	delete[] localNM;

	struct trans_stat_struct ans;
	ans.frac_scopy = stats_scopy.median()/stats.median();
	ans.frac_mpi = stats_mpi.median()/stats.median();
	ans.frac_rcopy = stats_rcopy.median()/stats.median();
	ans.bw = (M*localn+localm*N)*8.0*2.0/stats.median();
	
	/*
	 * only the last transpose is counted here
	 */
	double nbytes = (M*localn + localm*N)*8.0*2.0;
	ans.cycles.scopy = trans_timer.scopy/nbytes;
	ans.cycles.mpi = trans_timer.mpi/nbytes;
	ans.cycles.send_post = trans_timer.mpi_send_post/nbytes;
	ans.cycles.recv_post = trans_timer.mpi_recv_post/nbytes;
	ans.cycles.recv_wait = trans_timer.mpi_recv_wait/nbytes;
	ans.cycles.send_wait = trans_timer.mpi_send_wait/nbytes;
	ans.cycles.rcopy = trans_timer.rcopy/nbytes;


	return ans;
}

void generate_output(int rank, int nprocs){
	assrt(nprocs >= 3);

	int M = 50000;
	int N = 5000*nprocs;

	verify_dir("OUTPUT");
	std::ofstream ofile;
	char fname[200];
	if(rank == 0){
#ifdef OMPCPY

#ifndef FTRANS
		sprintf(fname, "OUTPUT/time_trans_omp.txt");
#else
		sprintf(fname, "OUTPUT/time_trans_fast.txt");
#endif

#else
		sprintf(fname, "OUTPUT/time_trans.txt");
#endif
	}

	struct trans_stat_struct tstat;
	tstat = time_trans(rank, nprocs, M, N);

	if(rank == 0){
		ofile.open(fname, std::ios::app);
		ofile<<"                  nprocs = "<<nprocs<<std::endl;
		ofile<<"                    rank = "<<rank<<std::endl;
#ifdef OMPCPY
		ofile<<"                nthreads = "<<NTHREADS<<std::endl;
#endif
		ofile<<"                       M = "<<M<<std::endl;
		ofile<<"                       N = "<<N<<std::endl;
		ofile<<"        bw (bytes/cycle) = "<<tstat.bw<<std::endl;
		ofile<<" frac of cycles in scopy = "<<tstat.frac_scopy
		     <<std::endl;
		ofile<<"   frac of cycles in mpi = "<<tstat.frac_mpi
		     <<std::endl;
		ofile<<" frac of cycles in rcopy = "<<tstat.frac_rcopy
		     <<std::endl;
		ofile<<"--------------------------"<<std::endl;
		ofile<<"cycles/byte in send copy = "<<tstat.cycles.scopy
		     <<std::endl;
		ofile<<"cycles/byte in recv copy = "<<tstat.cycles.rcopy
		     <<std::endl;
		ofile<<"      cycles/byte in mpi = "<<tstat.cycles.mpi
		     <<std::endl;
		ofile<<"cycles/byte in send post = "<<tstat.cycles.send_post
		     <<std::endl;
		ofile<<"cycles/byte in recv post = "<<tstat.cycles.recv_post
		     <<std::endl;
		ofile<<"cycles/byte in send wait = "<<tstat.cycles.send_wait
		     <<std::endl;
		ofile<<"cycles/byte in recv wait = "<<tstat.cycles.recv_wait
		     <<std::endl;
		ofile<<std::endl;
		ofile.close();
	}
}

int main(){
#ifdef FTRANS
#ifndef OMPCPY
	assrt(0 == 1);
#endif
#endif

	int rank, nprocs;
	mpi_initialize(rank, nprocs);

	generate_output(rank, nprocs);
	
	mpi_finalize();
}
