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

