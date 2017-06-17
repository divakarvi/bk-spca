#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int global;

void f(){
	double farray[512];
	printf(" farray = %p\n", farray);
}

int main(){
	double marray[512];
	printf(" marray = %p\n", marray);
	f();
	printf("\n");
	double *ptr;
	ptr = (double *)malloc(1000);
	printf("    ptr = %p\n", ptr);    
	printf("\n");
	printf("&global = %p\n", &global);
	printf("      f = %p\n", &f);
	printf("   main = %p\n", &main);
	free(ptr);
}

