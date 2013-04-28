#ifndef __dvmesg_header_march2013__
#define __dvmesg_header_march2013__
#include <unistd.h>
#include <asm/unistd.h>
#define set_dvflag(flag)			\
	syscall(__NR_set_dvflag, flag);
#endif
