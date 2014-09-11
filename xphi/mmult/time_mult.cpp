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
#include "../../utils/TimeStamp.hh"
#include "../../utils/StatVector.hh"
#include "../../utils/Table.hh"
#include "mmult.hh"
#include <mkl.h>

enum mult_flag_enum {HOST, MIC, AUTO};

/*
 * returns flops per cycle
 */
double time_mult(long dim, enum mult_flag_enum flag){
	int count = 10;

	double *a = new double[dim*dim];
	double *b = new double[dim*dim];
	double *c = new double[dim*dim];

#pragma omp parallel for
	for(long i=0; i < dim*dim; i++)
		a[i] = b[i] = c[i] = 1;

	TimeStamp clk;
	StatVector stats(count);

	if(flag == AUTO)
		mkl_mic_enable();

	for(int i=0; i < count; i++){
		clk.tic();
		switch(flag){
		case HOST: 
			mmult(a, b, c, dim);
			break;
		case MIC:
#pragma offload target(mic)						\
	in(a:length(dim*dim) align(64) alloc_if(1) free_if(1))		\
	in(b:length(dim*dim) align(64) alloc_if(1) free_if(1))		\
	inout(c: length(dim*dim) align(64) alloc_if(1) free_if(1))
			mmult(a, b, c, dim);
			break;
		case AUTO:
			mmult(a, b, c, dim);
			break;
		}
		double cycles = clk.toc();
		stats.insert(cycles);
	}

	if(flag == AUTO)
		mkl_mic_disable();

	delete[] a;
	delete[] b;
	delete[] c;

	return 2.0*dim*dim*dim/stats.median();
}

int main(){
	const char* rows[3] = {"8000", "10000", "12000"};
	long dim[3] = {8000, 10000, 12000};
	const char* cols[3] = {"host", "offload", "auto offload"};
	enum mult_flag_enum flag[3] = {HOST, MIC, AUTO};
	double data[9];

	for(int i=0; i < 3; i++)
		for(int j=0; j < 3; j++){
			std::cout<<"("<<i<<","<<j<<")"<<std::endl;
			data[i+j*3] = time_mult(dim[i], flag[j]);
		}

	verify_dir("DBG");
	//link_cout("DBG/time_mult.txt");

	Table tbl;
	tbl.dim(3,3);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("flops/cycle for multiplying square matrices");

	//unlink_cout();
}
