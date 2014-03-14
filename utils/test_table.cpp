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

#include "Table.hh"
#include <cstdlib>

int main(){
	const int m = 3;
	const int n = 4;
	const char* rows[3] = {"dog", "cat", "hat"};
	const char* cols[4] = {"Asia", "Europe", "Africa", "America"};
	double data[m*n];
	for(int i=0; i < m*n; i++)
		data[i] = rand()*1.0/RAND_MAX;

	Table table;
	table.dim(m, n);
	table.rows(rows);
	table.cols(cols);
	table.data(data);
	table.print("animals and continents");
}
