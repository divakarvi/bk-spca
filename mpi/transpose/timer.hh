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

