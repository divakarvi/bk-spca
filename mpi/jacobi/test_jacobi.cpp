#include "../../utils/utils.hh"
#include "../init/mpi_init.hh"
#include "jacobi.hh"
#include <omp.h>

void test_jacobi(int rank, int nprocs){
	int dim1 = 10;
	int dim2 =  36;
	int nth = 12;
	
	Jacobi2D jacobi(rank, nprocs, dim1, dim2, nth);
	jacobi.initializepp();
	for(int i=0; i < 1000; i++){
		jacobi.postsendrecv();
		jacobi.wait();
		jacobi.updatepp();
		jacobi.copypp();
	}

	verify_dir("DBG");
	char fname[200];
	sprintf(fname, "DBG/test_jacobi%d.txt", rank);
	link_cout(fname);

	array_show(jacobi.geta(), dim1*dim2, "interior points");

	unlink_cout();
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
#pragma omp parallel\
	num_threads(12)
	{
		if (rank==0)
			printf("tid %d: total = %d\n",
			       omp_get_thread_num(), omp_get_num_threads());
	}
	test_jacobi(rank, nprocs);
	mpi_finalize();
}

