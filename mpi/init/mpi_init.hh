#ifndef MPIINIT21NOV2013
#define MPIINIT21NOV2013

enum gl_mpi_onoff_enum {MPION, MPIOFF};
extern enum gl_mpi_onoff_enum gl_mpi_onoff;

/*
 * Calls MPI_Init().
 * Initializes rank and nprocs.
 * Sets gl_mpi_onoff to MPION.
 */
void mpi_initialize(int& rank, int& nprocs);

/*
 * Calls MPI_Finalize().
 * Sets gl_mpi_onoff to MPIOFF
 */
void mpi_finalize();

/*
 * n: number of items to be divided
 * P: nprocs typically.
 * fst[]: returns array of length P+1.
 *
 * 0 =fst[0] <= ... <= fst[P] = n at output.
 * The block owned by p is fst[p] <= i < fst[p+1].
 * Blocks are nearly even.
 */
void BlockDivide(long n, int P, long *fst);

/*
 * Prints name of node and its rank on std::cout.
 */
void mpi_print_name(int rank);
#endif

