#include <unistd.h>
#include <asm/unistd.h>
#include <stdio.h>

int main(){
	int y=syscall(__NR_set_dvflag, 1);
	printf("%d \n",y);
}
