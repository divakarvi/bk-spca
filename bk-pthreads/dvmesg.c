#include <unistd.h>
#include <asm/unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include "dvmesg.h"

int main(int argc, char **argv){
    if(argc==1){
	printf("100<=flag<200: pty_open() \n");
	printf("200<=flag<300: clone(), fork(), copy_process(), do_fork() \n");
	printf("300<=flag<400: getpid() (vm area stuff) \n");
	printf("400<=flag<500: futex_wakeup \n");
    }
    else{
	int flag = atoi(argv[1]);
	long y = syscall(__NR_set_dvflag, flag);
	printf("77=%ld\n", y);
	y = set_dvflag(flag);
	printf("77=%ld\n", y);
    }
}
