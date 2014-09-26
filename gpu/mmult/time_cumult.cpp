#include "../../utils/utils.hh"
#include "../../utils/TimeStamp.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/Table.hh"
#include "../utils/const.hh"
#include "cumult.hh"
#include <cstdio>
#include <iostream>

double time_mult(int N){
	double *A = new double[N*N];
	double *B = new double[N*N];
	double *C = new double[N*N];

	for(int i=0; i < N*N; i++){
		A[i] = 1.0*rand()/RAND_MAX-0.5;
		B[i] = 1.0*rand()/RAND_MAX-0.5;
		C[i] = 1.0*rand()/RAND_MAX-0.5;
	}	

	CuMult cumult(N);
	const int count = 10;
	StatVector stats(count);

	double tms;
	for(int i=0; i < count; i++){
		tms = cumult.mult(A, B, C);
		stats.insert(tms);
	}

	delete[] A;
	delete[] B;
	delete[] C;
	return stats.median();
}

int main(){
	const char *rows[] = {"8000", "10000", "12000"};
	const char *cols[] = {"GFlops/s"};
	double data[3];
	int N[3] = {8000, 10000, 12000};

	double tms;
	for(int i=0; i < 3; i++){
		printf("%d\n",i);
		tms = time_mult(N[i]);
		/* convert to GFlops/s */
		data[i] = 2.0*N[i]*N[i]*N[i]/tms*1000/1e9;
	}

	Table table;
	table.dim(3, 1);
	table.rows(rows);
	table.cols(cols);
	table.data(data);
	verify_dir("DBG");
	link_cout("DBG/time_mult.txt");
	table.print("matrix mult using cublas");
	unlink_cout();
}
