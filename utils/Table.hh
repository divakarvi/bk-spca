#ifndef __Table04Sept2013__
#define __Table04Sept2013__
#include "utils.hh"

class Table{
private:
	int state;
	int width;
	const char* (*rowlist);
	const char* (*collist);
	double *datarr;
	int m, n; //dim of data
public:
	Table():state(0){
		width = 15;
	};
	/*
	 * change column width from default of 15
	 */
	void set_width(int w){
		assrt(state == 0);
		width = w;
	}
	void dim(int nrows, int ncols){
		assrt(state == 0);
		state = 1;
		m = nrows;
		n = ncols;
	}

	void rows(const char *rowsi[]){
		assrt(state == 1);
		state = 2;
		rowlist = rowsi;
	}
	
	void cols(const char* colsi[]){
		assrt(state == 2);
		state = 3;
		collist = colsi;
	}
	
	/*
	 * templates might be a good idea here
	 */
	void data(double *datai){
		assrt(state == 3);
		state = 4;
		datarr = datai;
	}
	
	void print(const char *banner="");
};

#endif
