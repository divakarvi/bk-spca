#ifndef __MPIUTILS21NOV2013__
#define __MPIUTILS21NOV2013__
/*
 * calls MPI_Init()
 * initializes rank and nprocs
 */
void mpi_initialize(int& rank, int& nprocs);
#endif
