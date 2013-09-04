#ifndef __Table04Sept2013__
#define __Table04Sept2013__
#include "utils.hh"

class Table{
private:
	int state;
	int width;
	const char* rows[];
	const char* cols[];
	double *data;
	int m, n; //dim of data
public:
	Table(int wi = 15):state(0){
		width = wi;
	};
	void width
	dim(int mi, int ni){
		state = 1;
		m = mi;
		n = ni;
	}

	void rows(const char *rowsi[]){
		assrt(state == 1);
		state = 2;
		rows = rowsi;
	}
	
	void cols(const char* colsi[]){
		assrt(state == 2);
		state = 3;
		cols = colsi;
	}
	
	/*
	 * templates might be a good idea here
	 */
	void data(double *datai){
		assrt(state == 3);
		state = 4;
		data = datai;
	}
	
	void print();
};

#endif
