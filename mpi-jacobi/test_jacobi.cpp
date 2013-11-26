#include "../utils/utils.hh"
#include "../mpi-init/mpi_init.hh"
#include "jacobi.hh"

void test_jacobi(int rank, int nprocs){
	int dim1 = 10;
	int dim2 =  30;
	int nth = 11;
	
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
	test_jacobi(rank, nprocs);
	mpi_finalize();
}
