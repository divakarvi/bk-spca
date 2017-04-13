#ifndef __MPIINIT21NOV2013__
#define __MPIINIT21NOV2013__

enum gl_mpi_onoff_enum {MPION, MPIOFF};
extern enum gl_mpi_onoff_enum gl_mpi_onoff;

/*
 * calls MPI_Init()
 * initializes rank and nprocs
 * sets gl_mpi_onoff to MPION
 */
void mpi_initialize(int& rank, int& nprocs);

/*
 * calls MPI_Finalize()
 * sets gl_mpi_onoff to MPIOFF
 */
void mpi_finalize();

/*
 * n = number of items to be divided
 * P = nprocs
 * fst[] = array of length P+1 
 *
 * 0 =fst[0] <= ... <= fst[P] = n at output
 * the block owned by p is fst[p] <= i < fst[p+1]
 * blocks are nearly even
 */
void BlockDivide(long n, int P, long *fst);

/*
 * print name of node and rank on std::cout
 */
void mpi_print_name(int rank);
#endif

