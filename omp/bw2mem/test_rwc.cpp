#include "../../utils/utils.hh"
#include "readwrcopy.hh"
#include <iostream>


void test_sum(){
	const int nthreads = 4;
	const long len = nthreads*1l*1000*1000;
	double *list = new double[len];
	init_manycore(list, len, nthreads);
	array_show(list, 10, "after init_many()");

	double x = sum_manycore(list, len, nthreads);
	std::cout<<"avg = "<<x/len<<std::endl;
	delete[] list;
}

void test_wc(){
	const int nthreads = 4;
	const long len = 20;
	double list[len];
	
	write_manycore(list, len, nthreads);
	array_show(list, len, "after write_manycore()");

	copy_manycore(list, len, nthreads);
	array_show(list, len, "after copy_manycore()");
}
int main(){
	test_sum();
	test_wc();
}
