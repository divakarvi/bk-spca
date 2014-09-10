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
#include "../init/mic_init.hh"
#include "mmult.hh"
#include <mkl.h>

double time_mult(long dim){
	int count = 10;

	double *a = new double[dim*dim];
	double *b = new double[dim*dim];
	double *c = new double[dim*dim];

#pragma omp parallel for
	for(long i=0; i < dim*dim; i++)
		a[i] = b[i] = c[i] = 1;

	TimeStamp clk;
	StatVector stats(count);
	
	for(int i=0; i < count; i++){
		clk.tic();
		mmult(a, b, c, dim);
		double cycles = clk.toc();
		stats.insert(cycles);
	}
	
	delete[] a;
	delete[] b;
	delete[] c;

	return 2.0*dim*dim*dim/(stats.median()*MIC_CYCLE_FACTOR);
}

int main(){
	const char* rows[3] = {"8000", "10000", "12000"};
	long dim[3] = {8000, 10000, 12000};
	const char* cols[1] = {"mic natively"};
	double data[3];

	for(int i=0; i < 3; i++){
		std::cout<<i<<std::endl;
		data[i] = time_mult(dim[i]);
	}

	verify_dir("DBG");
	link_cout("DBG/time_mic.txt");

	Table tbl;
	tbl.dim(3,1);
	tbl.rows(rows);
	tbl.cols(cols);
	tbl.data(data);
	tbl.print("flops/cycle for mult square matrices [host cycles]");

	unlink_cout();
}
