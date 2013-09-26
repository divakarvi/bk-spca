#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "../utils/Table.hh"
#include "../utils/utils.hh"
#include <iostream>
#include <cmath>
#include <cstdio>
#include <mkl.h>

using namespace std;

extern void multijk(double *a, double *b, double *c, int dim);
extern void multijkx(double *a, double *b, double *c, int dim);
extern void multIJK(double *restrict a, double *restrict b, 
		    double *restrict c, int dim);
extern void multIJKX(double *restrict a, double *restrict b, 
		    double *restrict c, int dim);

enum mmult_enum {ijk, ijkx, IJK, IJKX, BLAS};

/*
 * dim = dimension of square matrices multiplied
 * flag =  multiplication function used
 * returns number of flops per cycle in matrix mult
 */
double time(int dim, enum mmult_enum flag){
	long nbytes = 4l*1000*1000*100; //use 0.4 GB of memory
	int count = nbytes/(dim*dim*sizeof(double)); 
	double *space = (double *)MKL_malloc(3*nbytes, 64);

	double *a = space;
	double *b = space + nbytes/8;
	double *c = space + 2*nbytes/8;
	
	/*
	 * not random but cheap
	 */
	for(long i=0; i < nbytes/8; i++)
		space[i] = 1.0/(i+2.0);

	TimeStamp clk;
	StatVector stats(count);
	for(int i=0; i < count; i++){
		clk.tic();
		switch(flag){
		case ijk:
			multijk(a, b, c, dim);
			break;
		case ijkx:
			multijkx(a, b, c, dim);
			break;
		case IJK:
			multIJK(a, b, c, dim);
			break;
		case IJKX:
			multIJKX(a, b, c, dim);
			break;
		case BLAS:
			char trans[3] = "N ";
			double alpha = 1;
			double beta = 1;
			dgemm(trans, trans,
			       &dim, &dim, &dim, &alpha,
			       a, &dim, b, &dim, &beta, c, &dim);
			break;
		}
		double cycles = clk.toc();
		stats.insert(cycles);
		a += dim*dim;
		b += dim*dim;
		c += dim*dim;
	}
	
	MKL_free(space);

	double cycles = stats.median();
	return 2.0*dim*dim*dim/cycles;
}


int main(){
	int dim[4] = {100, 101, 102, 103};
	const char* rows[4] = {"100", "1000", "2000", "6000"};
	enum mmult_enum flags[5] = {ijk, ijkx, IJK, IJKX, BLAS};
	const char* cols[5] = {"ijk", "ijkx", "IJK", "IJKX", "MKL BLAS"};
	double flpscyc[20];

	for(int j = 0; j < 5; j++)
		for(int i = 0; i < 4; i++)
			flpscyc[i+j*4] = time(dim[i], flags[j]);
	Table table;
	table.dim(4, 5);
	table.rows(rows);
	table.cols(cols);
	table.data(flpscyc);

	verify_dir("DBG");
	std::streambuf *sbuf = std::cout.rdbuf();
	ofstream ofile("DBG/xchg-mult.txt");
	std::cout.rdbuf(ofile.rdbuf());
	
	table.print("flops per cycle (mult of sq matrices)");
		
	std::cout.rdbuf(sbuf);
	ofile.close();
}
