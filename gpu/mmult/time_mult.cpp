#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/Table.hh"
#include "../utils/const.hh"
#include "mmult.hh"
#include "cuda_runtime.h"
#include <cstdio>

double time_mult(int N, enum mmult_enum flag){
	assrt(N%SQRTT==0);
	
	double *A = new double[N*N];
	double *B = new double[N*N];
	double *C = new double[N*N];

	for(int i=0; i < N*N; i++){
		A[i] = 1.0*rand()/RAND_MAX-0.5;
		B[i] = 1.0*rand()/RAND_MAX-0.5;
		C[i] = 1.0*rand()/RAND_MAX-0.5;
	}	

	const int count = 10;
	StatVector stats(count);
	
	double tms;
	for(int i=0; i < count; i++){
		tms = mmult(A, B, C, N, flag);
		stats.insert(tms);
	}

	delete[] A;
	delete[] B;
	delete[] C;
	return stats.median();
}

int main(){
	cudaError_t code;
	cudaDeviceSetCacheConfig(cudaFuncCachePreferShared);
	assrt(code==cudaSuccess);

	const char *rows[] = {"1600", "3200", "4000"};
	const char *cols[] = {"GMEM", "SMEM"};
	double data[6];

	int N[3] = {1600, 3200, 4000};
	enum mmult_enum flag[2] = {GMEM_MULT, SMEM_MULT};
	double tms;
	for(int i=0; i < 3; i++)
		for(int j=0; j < 2; j++){
			printf("(%d,%d)\n",i,j);
			tms = time_mult(N[i], flag[j]);
			/* convert to GFlops/s */
			data[i+j*3] = 2.0*N[i]*N[i]*N[i]/tms*1000/1e9;
		}

	Table table;
	table.dim(3, 2);
	table.rows(rows);
	table.cols(cols);
	table.data(data);
	verify_dir("DBG");
	link_cout("DBG/time_mult.txt");
	table.print("matrix mult using global mem vs shared mem: GF/s");
	unlink_cout();
}

