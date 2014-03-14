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

#ifndef __TRANSTIMER24NOV2013__
#define __TRANSTIMER24NOV2013__

/*
 * struct to count cycles during transpose
 */
struct trans_timer_struct {
	double scopy;
	double mpi;
	double mpi_send_wait;
	double mpi_recv_wait;
	double mpi_send_post;
	double mpi_recv_post;
	double rcopy;
};
/*
 * struct to save cycles used by send copy, mpi, recv copy
 */
extern struct trans_timer_struct trans_timer;
/*
 * zeros all entries of trans_cycles
 */
void zero_trans_timer();

#endif
