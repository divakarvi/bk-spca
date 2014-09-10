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

#include "phi_instns.hh"
#include <iostream>

void test_fma(){
	__declspec(align(64)) double a[8] = {1, 2, 3, 4, 5, 6, 7, 8};
	__declspec(align(64)) double b[8] = {1, 2, 3, 4, 5, 6, 7, 8};
	__declspec(align(64)) double c[8] = {1, 2, 3, 4, 5, 6, 7, 8};

	fma(a, b, c);

	for(int i=0; i < 8; i++)
		std::cout<<"("<<a[i]<<","<<b[i]<<","<<c[i]<<")"<<std::endl;
}

int main(){
	test_fma();
}
