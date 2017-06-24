#ifndef jacobi22Nov2013
#define jacobi22Nov2013
#include <mpi.h>

class Jacobi2D{
private:
	int nthreads;
	/*
	 * dim1 x dim2: dimension of data on a single node.
	 */
	int dim1;
	int dim2;
	/*
	 * a[] and b[] are both dim1 x (dim2+2)
	 * Extra column on left is rightmost column of left neighbor.
	 * Extra column on right is leftmost column of right neighbor.
	 * Each  iteration updates b[] using a[]. 
	 */
	double *a, *b;
	/*
	 * lrank: rank of MPI process to the left.
	 * rrank: rank of MPI process to the right.
	 */
	int lrank;
	int rrank;
	MPI_Request reqlist[4];
	/*
	 * Helper function for public members.
	 */
	void leftrightinit();
	void initialize(int col1, int col2);
	void update(int col1, int col2);
	void copy(int col1, int col2);
public:
	/*
	 * d1(dim1) must be even.
	 * d2(dim2) must be even.
	 * Evenness is assumed by initializepp() to get chessboard pattern.
	 */
	Jacobi2D(int rank, int nprocs, int d1, int d2, int nth);
	~Jacobi2D();
	/*
	 * Initializes to chessboard pattern of +/- 1.
	 */
	void initializepp();
	void postsendrecv();
	void wait();
	/*
	 * Updates b[] using a[].
	 */
	void updatepp();
	/*
	 * Copies a[] to b[].
	 */
	void copypp();
	/*
	 * Returns pointer to data excluding column from left neighbor.
	 */
	double* geta(){return a+dim1;}
};

#endif

