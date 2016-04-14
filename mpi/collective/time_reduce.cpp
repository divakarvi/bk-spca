#include "../../utils/utils.hh"
#include "../../utils/Table.hh"
#include "../../utils/StatVector.hh"
#include "../init/mpi_init.hh"
#include "reduce.hh"
#include <iostream>
#include <fstream>

double time_reduce(int rank, int nprocs, int n, int flag){
	const int count = 500;
	StatVector stats(count);
	double *sendbuf = new double[n];
	double *recvbuf = new double[n];
	double *scratch = new double[n];
	srand(rank+100);
	for(int i=0; i < n; i++)
		sendbuf[i] = rand()*1.0/RAND_MAX;
	double cycles;
	for(int i=0; i < count; i++){
		if(flag==0)
			cycles = reducemin(rank, nprocs, sendbuf, recvbuf, n);
		else
			cycles = reducemin_tree(rank, nprocs, sendbuf, recvbuf,
						scratch, n);
		stats.insert(cycles);
	}
	
	delete[] sendbuf;
	delete[] recvbuf;
	delete[] scratch;
	return stats.median();
}

void time_reduce(int rank, int nprocs){
	char ostring[200];
	std::ofstream ofile;
	if(rank==0){
		ofile.open("output/reduce.txt", std::ios_base::app);
		long posn = ofile.tellp();
		if(posn<=0){
			ofile<<"num of trials = "<<500<<std::endl;
			ofile<<"\t"<<"nprocs"<<"\t"
			     <<"bufsize"<<"\t\t"<<"cycles"<<std::endl;
		}
	} 
	int nlist[4] = {1, 100, 1000*100, 1000*1000};
	for(int flag=0; flag<2; flag++){
		ofile<<((flag==0)?"mpi_reduce":"loop_reduce")<<std::endl;
		for(int i=0; i < 4; i++){
			int n = nlist[i];
			double cycles = time_reduce(rank, nprocs, n, flag);
			ofile<<"\t"<<nprocs<<"\t"
			     <<(double)n<<"\t\t"<<cycles<<std::endl;
		}
	}
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);

	time_reduce(rank, nprocs);

	mpi_finalize();
}
