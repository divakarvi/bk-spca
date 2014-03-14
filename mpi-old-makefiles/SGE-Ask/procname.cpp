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

#include "TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
#include <mpi.h>
#include <iostream>
using namespace std;

int main(int argc, char **argv){
  MPI_Init(NULL, NULL);
  int numprocs, rank;
  MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  char procname[200];
  int procnamelen;
  MPI_Get_processor_name(procname, &procnamelen);
  cout<<"proc name = "<<procname<<" rank = "<<rank<<endl;
  MPI_Finalize();
}
