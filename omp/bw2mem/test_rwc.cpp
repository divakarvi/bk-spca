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

#include "../../utils/utils.hh"
#include "readwrcopy.hh"
#include <iostream>


void test_sum(){
	const int nthreads = 4;
	const long len = nthreads*1l*1000*1000;
	double list[len];
	init_manycore(list, len, nthreads);
	array_show(list, 10, "after init_many()");

	double x = sum_manycore(list, len, nthreads);
	std::cout<<"avg = "<<x/len<<std::endl;
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
