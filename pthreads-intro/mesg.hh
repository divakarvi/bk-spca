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

#ifndef __mesg23OCT2013__
#define __mesg23OCT2013__
/*
 * print the message in arg after casting to char *
 */
void *print_message(void *arg);

/*
 * create 3 threads each of which prints a message using print_message()
 */
void fork_pthreads();

/*
 * uses a mutex for mutual excl while printing a message
 */
void *print_message_mutex(void *arg);

/*
 *  create 3 threads each of which prints a message using print_message_mutex()
 */
void fork_pthreads_mutex();

/*
 * uses a spinlock for mutual excl while printing a message
 */
void *print_message_spinlock(void *arg);

/*
 *  create 3 threads each of which prints a message using above
 */
void fork_pthreads_spinlock();


#endif
