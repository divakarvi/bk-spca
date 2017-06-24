#ifndef TRANSTIMER24NOV2013
#define TRANSTIMER24NOV2013

/*
 * struct to count cycles during transpose.
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
 * struct to save cycles used by send copy, mpi, recv copy.
 */
extern struct trans_timer_struct trans_timer;

/*
 * Zeros all entries of struct trans_cycles.
 */
void zero_trans_timer();

#endif

