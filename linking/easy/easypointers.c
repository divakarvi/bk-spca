#include <stdio.h>
int main(){
	int x;
	int list[3];
	int *a; 
	a = &x;
	list[1]=2;
	*a = 35+list[1];
	printf("%p %p %d\n", &x, list, x); 
}
