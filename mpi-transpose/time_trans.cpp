#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../mpi-init/mpi_init.hh"
#include "timer.hh"
#include "trans.hh"
#include "fast_trans.hh"
#include <fstream>

struct trans_stat_struct{
  double bw; 
  double frac_scopy;
  double frac_mpi;
  double frac_rcopy;
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

	for(long i=0; i < M*localn; i++)
		localMN[i] = rand()*1.0/RAND_MAX-0.5;

	for(int i=0; i < count; i++){
		TimeStamp clk;
		zero_trans_timer();
		clk.tic();

		transmn.transpose(localMN, localNM);
		transnm.transpose(localNM, localMN);
		
		stats.insert(clk.toc());
		stats_scopy.insert(trans_timer.scopy);
		stats_mpi.insert(trans_timer.mpi);
		stats_rcopy.insert(trans_timer.rcopy);
	}
	
	delete[] localMN;
	delete[] localNM;
	
	double frac_scopy = stats_scopy.median()/stats.median();
	double frac_mpi = stats_mpi.median()/stats.median();
	double frac_rcopy = stats_rcopy.median()/stats.median();
	double bw = (M*localn+localm*N)*8.0*2.0/stats.median();
	struct trans_stat_struct ans;
	ans.bw = bw;
	ans.frac_scopy = frac_scopy;
	ans.frac_mpi = frac_mpi;
	ans.frac_rcopy = frac_rcopy;

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
