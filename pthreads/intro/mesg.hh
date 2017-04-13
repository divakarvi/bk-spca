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

