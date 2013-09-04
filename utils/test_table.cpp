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
