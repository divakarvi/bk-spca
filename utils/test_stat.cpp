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

#include "StatVector.hh"
#include <iostream>

//n=number of items to be inserted
//all numbers inserted are from 0 to 255
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
