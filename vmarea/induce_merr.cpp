#include "maccess.hh"
#include <cstdio>
#include <cstdlib>

void run1(long n){
	long *a = (long *)malloc(5*sizeof(long));
	printf("a = %p \n", a);
	printf("page alignment = bndry + %ld \n", (long)a%4096);
	maccess(a, n);
	free(a);
}

int main(){
	printf("\t\ta[0...4] defined\n");
	printf("\t\ta[0..4] accesed\n");
	printf("\t\ta[n-1] accessed\n");
	long n;
	printf("n = ");
	scanf("%ld", &n);
	run1(n);
}
