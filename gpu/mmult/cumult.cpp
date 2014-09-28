#include "../../utils/utils.hh"
#include "../utils/dhstmem.hh"
#include "../utils/hstTimer.hh"
#include "cumult.hh"
#include <cublas_v2.h>
#include <cuda_runtime.h>

CuMult::CuMult(int Ni)
	:N(Ni), memA(N*N), memB(N*N), memC(N*N){
	cublasStatus_t code;

	code = cublasCreate(&h);
	assrt(code == CUBLAS_STATUS_SUCCESS);

	cudaError_t ccode;
	ccode = cudaDeviceSetCacheConfig(cudaFuncCachePreferShared);
	assrt(ccode==cudaSuccess);
}

CuMult::~CuMult(){
	cublasStatus_t code;

	code = cublasDestroy(h);
	assrt(code == CUBLAS_STATUS_SUCCESS);
}

double CuMult::mult(double *A, double *B, double *C){
	cublasStatus_t code;

	for(int i=0; i < N*N; i++){
		memA.host()[i] = A[i];
		memB.host()[i] = B[i];
		memC.host()[i] = C[i];
	}
	memA.host2device();
	memB.host2device();
	memC.host2device();

	double alpha = 1.0;
	double beta = 1.0;
	

	hstTimer hclk;
	hclk.tic();
	code = cublasDgemm(h, 
			     CUBLAS_OP_N, CUBLAS_OP_N,
			     N, N, N,
			     &alpha,
			     memA.device(), N, 
			     memB.device(), N,
			     &beta,
			     memC.device(), N);
	double tms = hclk.toc();
	assrt(code == CUBLAS_STATUS_SUCCESS);
	
	memC.device2host();
	for(int i=0; i < N*N; i++)
		C[i] = memC.host()[i];
	
	return tms;
}
