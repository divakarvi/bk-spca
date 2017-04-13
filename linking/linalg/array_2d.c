#include <stdio.h>

int main(){
	double a[20][40];
	double (*b)[40];
	double *c;
	int i, j;

	for(i=0; i < 20; i++)
		for(j=0; j < 40; j++)
			a[i][j] = i*100+j;

	b = a+5;
	c = a[5];
	
	printf("a[5][7] \t= %f \n", a[5][7]); 
	printf("b[0][7] \t= %f \n", b[0][7]); 
	printf("c[7]    \t= %f \n", c[7]); 
}

