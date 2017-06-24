#include "../../utils/utils.hh"
#include "../init/mpi_init.hh"
#include "trans.hh"
#include "fast_trans.hh"
#include <cstdlib>

void test1(int rank, int nprocs, int M, int N){
	assrt(M < 1000);

#ifndef FTRANS	
	Transpose trans(rank, nprocs, M, N);
#else
	FastTrans trans(rank, nprocs, M, N);
#endif
	double *localMN;
	double *localNM;
	localMN = new double[(trans.ffstN(rank+1)-trans.ffstN(rank))*M];
	localNM = new double[(trans.ffstM(rank+1)-trans.ffstM(rank))*N];

	/*
	 * Initializes matrices.
	 */
	for(long i=0; i < N*(trans.ffstM(rank+1)-trans.ffstM(rank)); i++)
		localNM[i] = -1;
	double base = 1000000;
	while(base <= trans.ffstN(nprocs))
		base *= 10;
	for(long col=0; col < trans.ffstN(rank+1)-trans.ffstN(rank); col++)
		for(long row = 0; row < M; row++)
			localMN[row+col*M] = base*row + col+trans.ffstN(rank);
	
	/*
	 * Outputs MN matrix.
	 */
	char fname[200];
	verify_dir("DBG");
	sprintf(fname, "DBG/test_sent%d.txt", rank);
	int nrows = M;
	int ncols = trans.ffstN(rank+1)-trans.ffstN(rank);
	array_out(localMN, nrows, ncols, fname);

	/*
	 * Transposes MN matrix to NM matrix.
	 */
	trans.transpose(localMN, localNM);

	/*
	 * Outputs NM matrix.
	 */
	sprintf(fname, "DBG/test_recvd%d.txt", rank);
	nrows = N;
	ncols = trans.ffstM(rank+1)-trans.ffstM(rank);
	array_out(localNM, nrows, ncols, fname);

	delete[] localNM;
	delete[] localMN;
}

void test2(int rank, int nprocs, long M, long N){
#ifndef FTRANS
	Transpose transmn(rank, nprocs, M, N);
	Transpose transnm(rank, nprocs, N, M);
#else
	FastTrans transmn(rank, nprocs, M, N);
	FastTrans transnm(rank, nprocs, N, M);
#endif
	double *localMN;
	double *localNM;
	double *localMNX;
	int localm = (transmn.ffstM(rank+1)-transmn.ffstM(rank));
	int localn = (transmn.ffstN(rank+1)-transmn.ffstN(rank));

	
	localMN = new double[M*localn];
	localMNX = new double[M*localn];
	localNM = new double[N*localm];
	
	for(int i=0; i < M*localn; i++)
		localMN[i] = 1.0*rand()/RAND_MAX-0.5;
	transmn.transpose(localMN, localNM);
	transnm.transpose(localNM, localMNX);

	array_diff(localMN, localMNX, M*localn);
	double err = array_max(localMN, M*localn);
	
	verify_dir("DBG");
	char fname[200];
	sprintf(fname, "DBG/test_err%d.txt", rank);
	link_cout(fname);
	std::cout<<"error = "<<err<<std::endl;
	unlink_cout();

	delete[] localMN;
	delete[] localMNX;
	delete[] localNM;
}

int main(){

#ifdef FTRANS
#ifndef OMPCPY
	assrt(0 == 1);
#endif
#endif
	
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	
	assrt(nprocs < 25);
	
	test1(rank, nprocs, 107, 56);
	test2(rank, nprocs, 107*100, 56*100);

	mpi_finalize();
}

