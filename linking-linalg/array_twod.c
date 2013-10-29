#include <stdio.h>

int main(){
	double a[20][40];
	double (*b)[40];
	double *c;
	int i, j;

	for(i=0; i < 20; i++)
		for(j=0; j < 40; j++)
			a[i][j] = i*100+j;

	b = a;
	c = a[5];
	
	printf("b \t= %p\nc \t= %p\na + 5\t= %p\nb + 5\t= %p \n",
	       b, c, a + 5, b + 5);
	printf("c[2] = %f, b[5] = %p \n", c[2], b[5]); 
}
