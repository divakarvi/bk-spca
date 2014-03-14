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

#ifndef __BCAST26NOV2013__
#define __BCAST26NOV2013__
/*
 * process of rank 0 (root = 0) broadcasts its buffer 
 * returns number of cycles consumed
 */
double bcast(int rank, int nprocs, double *buffer, int bufsize);

/*
 * same as above but using Isend and Irecv
 */
double bcast_srecv(int rank, int nprocs, double *buffer, int bufsize);
#endif
