#include "../../utils/utils.hh"
#include "../utils/const.hh"
#include "../utils/dhstmem.hh"
#include "../utils/hstTimer.hh"
#include "mmult.hh"


__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void mmult_gmem(double *A, double *B, double * C, int N){
	int tidx = threadIdx.x;
	int tidy = threadIdx.y;
	int bidx = blockIdx.x;
	int bidy = blockIdx.y;
	int i = bidx*blockDim.x + tidx;
	int j = bidy*blockDim.y + tidy;
	for(int k = 0; k < N; k++)
		C[i+j*N] += A[i+k*N]*B[k+j*N];
}

__global__ 
__launch_bounds__(THinBLK, BLKinMP)
void mmult_smem(double *A, double *B, double * C, int N){
	int tidx = threadIdx.x;
	int tidy = threadIdx.y;
	int bidx = blockIdx.x;
	int bidy = blockIdx.y;

	__shared__ double smem[3*THinBLK];
	double *smemA = smem;
	double *smemB = smem+THinBLK;
	double *smemC = smem+2*THinBLK;
	int i = tidx + bidx*blockDim.x;
	int j = tidy + bidy*blockDim.y;

	smemC[tidx + SQRTT*tidy] = C[i + N*j];
	for(int k = 0; k < N; k += SQRTT){
		smemA[tidx + SQRTT*tidy] = A[i + N*(k+tidy)]; 
		smemB[tidx + SQRTT*tidy] = B[(k+tidx) + N*j];
		__syncthreads();
		for(int kk=0; kk < SQRTT; kk++)
			smemC[tidx+SQRTT*tidy] += 
				smemA[tidx+SQRTT*kk]*smemB[kk+SQRTT*tidy];
		__syncthreads();/*bug here took several hours to fix*/
	}
	C[i + N*j] = smemC[tidx + SQRTT*tidy];

}


double mmult(double *A, double *B, double *C, int N, 
	   enum mmult_enum flag){
	assrt(SQRTT*SQRTT==THinBLK);
	assrt(N%SQRTT==0);
	
	dim3 grid(N/SQRTT, N/SQRTT);
	dim3 tblk(SQRTT, SQRTT);
	
	dhstmem<double> dhA(N*N);
	dhstmem<double> dhB(N*N);
	dhstmem<double> dhC(N*N);
	for(int i=0; i < N*N; i++){
		dhA.host()[i] = A[i];
		dhB.host()[i] = B[i];
		dhC.host()[i] = C[i];
	}
	dhA.host2device();
	dhB.host2device();
	dhC.host2device();

	hstTimer hclk;
	hclk.tic();
	switch(flag){
	case GMEM_MULT:
		mmult_gmem<<<grid, tblk>>>(dhA.device(), dhB.device(),
					   dhC.device(), N);
		break;
	case SMEM_MULT:
		mmult_smem<<<grid, tblk>>>(dhA.device(), dhB.device(),
					   dhC.device(), N);
		break;
	}
	double tms = hclk.toc();

	dhC.device2host();
	for(int i=0; i < N*N; i++)
		C[i] = dhC.host()[i];

	return tms;
}

