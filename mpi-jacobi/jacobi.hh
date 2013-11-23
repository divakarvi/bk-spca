#ifndef __jacobi22Nov2013__
#define __jacobi22Nov2013__
#include <mpi.h>

class Jacobi2D{
private:
	int nthreads;
	int dim1;
	int dim2;
	/*
	 * a and b are both dim1 x dim2
	 * each  iteration updates b[] using a[]
	 */
	double *a;
	double *b;
	/*
	 * left = leftmost column supplementing a[] matrix
	 * right = rightmost column supplementing a[] matrix
	 * with the edges the dim at every node is dim1 x (dim2 + 2)
	 */
	double *left;
	double *right;
	/*
	 * lleft = rightmost column of matrix to the left
	 * rright = leftmost column of matrix to the right
	 */
	double *lleft;
	double *rright;
	/*
	 * bleft = leftmost column supplementing b[] matrix
	 * bright = rightmost column supplementing b[] matrix
	 */
	double *bleft, *bright;
	/*
	 * lrank = rank of MPI process to the left
	 * rrank = rank of MPI process to the right
	 */
	int lrank;
	int rrank;
	MPI_Request reqlist[4];
	/*
	 * helper function for public members
	 */
	void leftrightinit();
	void initialize(int col1, int col2);
	void updateinterior(int col1, int col2);
	void copy(int col1, int col2);
public:
	/*
	 * d1(dim1) must be even
	 * d2(dim2) must be even
	 * even ---> assumed by initializepp() to get chessboard pattern
	 * dim2 divisible by nthreads ---> used to partition columns
	 * (not needed?)
	 */
	Jacobi2D(int d1, int d2, int rank, int nprocs, int nth);
	~Jacobi2D();
	/*
	 * initialize to chessboard pattern of +/- 1
	 */
	void initializepp();
	void postsendrecv();
	/*
	 * b[] updated using a[], left, right
	 */
	void updateinteriorpp();
	void wait();
	/*
	 * bleft, bright updated using left, right, lleft, rright,
	 * and first and last columns of a[]
	 */
	void updateboundary();
	/*
	 * copy a[], left, right to b[], bleft, bright
	 */
	void copypp();
	double& operator()(int i, int j){return a[i+j*dim1];}
	double& l(int i){return left[i];}
	double& r(int i){return right[i];}
};

#endif
