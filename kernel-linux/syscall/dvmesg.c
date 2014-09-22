/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include <unistd.h>
#include <asm/unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include "dvmesg.h"

#define __NR_set_dvflag 314

int main(int argc, char **argv){
	if(argc==1){
		printf("100<=flag<200: pty_open() \n");
		printf("200<=flag<300: "
		       "clone(), fork(), copy_process(), do_fork() \n");
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
