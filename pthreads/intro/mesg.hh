#ifndef mesg23OCT2013
#define mesg23OCT2013
/*
 * Prints the message in arg[] after casting to char *.
 */
void *print_message(void *arg);

/*
 * Creates 3 threads each of which prints a message using print_message().
 */
void fork_pthreads();

/*
 * Uses a mutex for mutual excl while printing a message.
 */
void *print_message_mutex(void *arg);

/*
 *  Creates 3 threads, each prints a message using print_message_mutex().
 */
void fork_pthreads_mutex();

/*
 * Uses a spinlock for mutual excl while printing a message.
 */
void *print_message_spinlock(void *arg);

/*
 * Create 3 threads each of which prints a message using above.
 */
void fork_pthreads_spinlock();


#endif

