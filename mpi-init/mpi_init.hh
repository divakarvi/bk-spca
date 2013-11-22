#ifndef __MPIINIT21NOV2013__
#define __MPIINITS21NOV2013__

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
#endif
