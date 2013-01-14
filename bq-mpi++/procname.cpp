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
