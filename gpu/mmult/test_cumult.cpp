#include "../../utils/utils.hh"
#include "cumult.hh"
#include <cstdlib>

void multq(double *A, double *B, double *C, int N){
	for(int i=0; i < N; i++)
		for(int j=0; j < N; j++)
			for(int k=0; k < N; k++)
				C[i+j*N] += A[i+k*N]*B[k+j*N];
}

void test_cumult(int N){
	double *A = new double[N*N];
	double *B = new double[N*N];
	double *C = new double[N*N];
	double *CC = new double[N*N];

	for(int i=0; i < N*N; i++){
		A[i] = 1.0; //1.0*rand()/RAND_MAX-0.5;
		B[i] = 1.0; //1.0*rand()/RAND_MAX-0.5;
		C[i] = 0.0; //1.0*rand()/RAND_MAX-0.5;
		CC[i] = C[i];
	}

	CuMult cumult(N);
	cumult.mult(A, B, C);
	multq(A, B, CC, N);
	
	array_diff(CC, C, N*N);
	std::cout<<"error = "<<array_max(CC, N*N)<<std::endl;
	
	delete[] A;
	delete[] B;
	delete[] C;
	delete[] CC;
}

int main(){
	test_cumult(1000);
}

