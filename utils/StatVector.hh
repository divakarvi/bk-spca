#ifndef __StatVector27June2013__
#define __StatVector27June2013__
#include <algorithm>
#include <iostream>
#include <iomanip>
#include "utils.hh"
using namespace std;

class StatVector{
	double *v;
	int size;
	int sortflag;
	int numitems;
	void dosort(){
		sort(v, v+numitems);
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
	void print(const char* banner = ""){
		cout<<setw(50)<<banner<<endl;
		cout<<setw(10)<<"mean: "<<this->mean()<<endl;
		cout<<setw(10)<<"median: "<<this->median()<<endl;
		cout<<setw(10)<<"min: "<<this->min()<<endl;
		cout<<setw(10)<<"max: "<<this->max()<<endl;
  }
};
#endif
