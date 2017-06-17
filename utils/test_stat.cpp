#include "StatVector.hh"
#include <iostream>

//n=number of items to be inserted
//All numbers inserted are from 0 to 255.
void runstatv(int n){
	long int pm = 32452843;
	StatVector v(n);
	for(int i=1; i <= n; i++){
		v.insert(i*pm%256);
	}
	std::cout<<"median = "<<v.median()<<std::endl;
	std::cout<<"mean = "<<v.mean()<<std::endl;
	std::cout<<"max = "<<v.max()<<std::endl;
	std::cout<<"min = "<<v.min()<<std::endl;
}

int main(){
	runstatv(100000);
}

