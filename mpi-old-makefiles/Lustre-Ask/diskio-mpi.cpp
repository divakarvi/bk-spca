/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include <mpi.h>
#include <cstdio>
#include <cstdlib>
#include "TimeStamp.hh"
#include <iostream>
using namespace std;

void mpi_initialize(int& rank, int& nprocs){
  MPI_Init(NULL, NULL);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
}


void write_mpi(void *data, long len, 
	       char *fname, long disp){
  MPI_File ofile;
  MPI_File_open(MPI_COMM_WORLD, 
		fname, 
		MPI_MODE_CREATE|MPI_MODE_WRONLY,
		MPI_INFO_NULL,
		&ofile);
  char datarep[200];
  sprintf(datarep, "native");
  MPI_File_set_view(ofile, 
		    disp, 
		    MPI_BYTE,
		    MPI_BYTE,
		    datarep,
		    MPI_INFO_NULL);
  MPI_File_write_at(ofile,
		    0,
		    data,
		    (int)len,
		    MPI_BYTE,
		    MPI_STATUS_IGNORE);
  MPI_File_close(&ofile);
}

double runwrite(long count){
  int rank;
  int nprocs;
  mpi_initialize(rank, nprocs);
  char *s = new char[count];
  for(long i=0; i < count; i++)
    s[i] = (i%2==0)?'a'+rank:'\n';
  char fname[200];
  sprintf(fname, "%s/parallel.dat", getenv("SCRATCH"));
  if(rank==0){
    char cmd[200];
    sprintf(cmd, "rm %s", fname);
    system(cmd);
  }
  MPI_Barrier(MPI_COMM_WORLD);
  TimeStamp clk;
  clk.tic();
  write_mpi((void *)s, count, fname, rank*count);
  double cycles = clk.toc();
  if(rank==0){
    cout<<"write b/w = "<<count*1.0/cycles<<" bytes/cycle"<<endl;
    char cmd[200];
    sprintf(cmd, "ls -l %s", getenv("SCRATCH"));
    system(cmd);
  }
  MPI_Finalize();
  delete[] s;
  return cycles;
}

int main(){
  runwrite(1000l*1000*1000);
}
