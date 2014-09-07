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

#ifndef __parallel16Oct2013__
#define __parallel16Oct2013__
#include "../../utils/StatVector.hh"

/*
 * nthreads = num of threads
 * stats = StatVector object
 * a single parallel region is entered
 * the entire body of the parallel region is a single call to dummy()
 * the num of cycles of the parallel region is inserted into stats
 */
void parallelA(int nthreads, StatVector& stats);

/*
 * exactly the same as parallelA, but defined in another compilation unit
 */
void parallelB(int nthreads, StatVector& stats);
#endif
