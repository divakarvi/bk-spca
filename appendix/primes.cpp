#include <cstdio>
#include "../utils/TimeStamp.hh"

void primes(char *p, int n){
	p[0] = 0;
	p[1] = 0;
	p[2] = 1;
	int ksqrt = 1;
	for(int k=3; k <= n; k++){
		if (ksqrt*ksqrt < k)
			ksqrt += 1;
		p[k] = 1;
		for(int j = 2; j <= ksqrt; j++)
			if ((p[j] == 1) && (k%j == 0)){
				p[k] = 0;
				break;
			}
	}
}

int main(){
	const int n = 1000*1000*10;
	char *p = new char[n+1];
	int count = 0;
	TimeStamp clk;
	clk.tic();
	primes(p, n);
	double cycles = clk.toc();
	
	for(int i=0; i <= n; i++)
		if (p[i] == 1)
			count += 1;
	printf("number of primes <= %d: %d\n", n, count); 
	printf("cycles consumed: %e\n", cycles);
	delete []p;
}

