#include "../../utils/utils.hh"
#include "../utils/const.hh"
#include "mmult.hh"

void multq(double *A, double *B, double *C, int N){
	for(int i=0; i < N; i++)
		for(int j=0; j < N; j++)
			for(int k=0; k < N; k++)
				C[i+j*N] += A[i+k*N]*B[k+j*N];
}

void test_mult(int N, enum mmult_enum flag){
	assrt(N%SQRTT==0);
	
	double *A = new double[N*N];
	double *B = new double[N*N];
	double *C = new double[N*N];
	double *CC = new double[N*N];

	for(int i=0; i < N*N; i++){
		A[i] = 1.0*rand()/RAND_MAX-0.5;
		B[i] = 1.0*rand()/RAND_MAX-0.5;
		C[i] = 1.0*rand()/RAND_MAX-0.5;
		CC[i] = C[i];
	}

	mmult(A, B, C, N, flag);
	multq(A, B, CC, N);

	array_diff(CC, C, N*N);
	std::cout<<"error = "<<array_max(CC, N*N)<<std::endl;
	
	delete[] A;
	delete[] B;
	delete[] C;
	delete[] CC;
}

int main(){
	//test_mult(SQRTT*23, GMEM_MULT);
	test_mult(SQRTT*23, SMEM_MULT);
}
