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

#ifndef __dvmesg_header_march2013__
#define __dvmesg_header_march2013__
#include <unistd.h>
#include <asm/unistd.h>
#define set_dvflag(flag)			\
	syscall(__NR_set_dvflag, flag);
#endif
