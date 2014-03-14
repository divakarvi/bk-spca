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

#include "timer.hh"

struct trans_timer_struct trans_timer;

void zero_trans_timer(){
	trans_timer.scopy = 0;
	trans_timer.mpi = 0;
	trans_timer.mpi_send_wait = 0;
	trans_timer.mpi_recv_wait = 0;
	trans_timer.mpi_send_post = 0;
	trans_timer.mpi_recv_post = 0;
	trans_timer.rcopy = 0;
}
