#ifndef __StatVector27June2013__
#define __StatVector27June2013__
#include <algorithm>
#include <iostream>
#include <iomanip>
#include "utils.hh"

class StatVector{
	double *v;
	int size;
	int sortflag;
	int numitems;
	void dosort(){
		std::sort(v, v+numitems);
		sortflag = 1;
	}
public:
	StatVector(int n){
		size = n;
		v = new double[n];
		sortflag=-1;
		numitems=0;
	}
	~StatVector(){
		delete[] v;
	}
	int getSize(){
		return size;
	}
	void insert(double x){
		assrt(numitems < size);
		v[numitems] = x;
		numitems++;
		sortflag = -1;
	}
	double median(){
		assrt(numitems > 0);
		if(sortflag != 1)
			dosort();
		return v[numitems/2];
	}
	double mean(){
		assrt(numitems > 0);
		if(sortflag != 1)
			dosort();
		double sum = 0;
		for(int i=0; i < numitems; i++)
			sum += v[i];
		return sum/numitems;
	}
	double max(){
		assrt(numitems > 0);
		if(sortflag != 1)
			dosort();
		return v[numitems-1];
	}
	double min(){
		assrt(numitems > 0);
		if(sortflag != 1)
			dosort();
		return v[0];
	}
	void flush(){
		sortflag = -1;
		numitems = 0; 
	}
	double operator()(int i) const{
		return v[i];
	}
	void print(const char* banner = ""){
		std::cout<<std::setw(50)<<banner<<std::endl;
		std::cout<<std::setw(10)<<"mean: "<<this->mean()<<std::endl;
		std::cout<<std::setw(10)<<"median: "<<this->median()<<std::endl;
		std::cout<<std::setw(10)<<"min: "<<this->min()<<std::endl;
		std::cout<<std::setw(10)<<"max: "<<this->max()<<std::endl;
	}
};
#endif
