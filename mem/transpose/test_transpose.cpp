#include "transpose.hh"
#include <iostream>

void testall(){
	const int m = B*4;
	const int n = B*4;
	double a[m*n], b[m*n];

	for(int i=0; i < m; i++)
		for(int j=0; j < n; j++)
			a[i+j*m] = i+j*m;

	easytrans(a, b, m, n);

	for(int i=0; i < m*n; i++)
		std::cout<<b[i]<<" ";
	std::cout<<std::endl<<std::endl;
  
	blocktrans(b, a, n, m);

	for(int i=0; i < m*n; i++)
		std::cout<<a[i]<<" ";
	std::cout<<std::endl<<std::endl;

	blocktransx(a, b, m, n);

	for(int i=0; i < m*n; i++)
		std::cout<<b[i]<<" ";
	std::cout<<std::endl<<std::endl;

	recursivetrans(b, a, n, m);

	for(int i=0; i < m*n; i++)
		std::cout<<a[i]<<" ";
	std::cout<<std::endl<<std::endl;
  
	if(m==n){
		int nb = n/B;
		while(nb>1){
			if(nb%2==1) 
				return;
			nb = nb/2;
		}

		pow2trans(b, a, n);

		for(int i=0; i < m*n; i++)
			std::cout<<a[i]<<" ";
		std::cout<<std::endl<<std::endl;
	}
}

int main(){
	testall();
}

