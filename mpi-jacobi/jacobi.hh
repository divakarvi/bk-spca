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
	double *a, *b;
	/*
	 * al = leftmost column supplementing a[] matrix
	 * right = rightmost column supplementing a[] matrix
	 * with the edges the dim at every node is dim1 x (dim2 + 2)
	 */
	double *al, *ar;
	/*
	 * ll = rightmost column of matrix to the left
	 * rr = leftmost column of matrix to the right
	 */
	double *ll, *rr;
	/*
	 * bl = leftmost column supplementing b[] matrix
	 * br = rightmost column supplementing b[] matrix
	 */
	double *bl, *br;
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
	Jacobi2D(int rank, int nprocs, int d1, int d2, int nth);
	~Jacobi2D();
	/*
	 * initialize to chessboard pattern of +/- 1
	 */
	void initializepp();
	void postsendrecv();
	/*
	 * b[] updated using a[], al, ar
	 */
	void updateinteriorpp();
	void wait();
	/*
	 * bl, br updated using al, ar, ll, rr,
	 * and first and last columns of a[]
	 */
	void updateboundary();
	/*
	 * copy a[], al, ar to b[], bl, br
	 */
	void copypp();
	double* geta(){return a;}
	double* getal(){return al;}
	double* getar(){return ar;}
};

#endif
