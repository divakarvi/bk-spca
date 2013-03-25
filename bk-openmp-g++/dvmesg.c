#include <unistd.h>
#include <asm/unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv){
    if(argc==1){
	printf("100<=flag<200: pty_open() \n");
	printf("200<=flag<300: clone(), fork(), copy_process(), do_fork() \n");
	printf("300<=flag<400: getpid() (vm area) \n");
    }
    else{
	int flag = atoi(argv[1]);
	long y = syscall(__NR_set_dvflag, flag);
	printf("77=%d\n", y);
    }
}
