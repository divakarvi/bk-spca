#include "timer.hh"

struct trans_timer_struct trans_timer;

//timer.hh.
void zero_trans_timer(){
	trans_timer.scopy = 0;
	trans_timer.mpi = 0;
	trans_timer.mpi_send_wait = 0;
	trans_timer.mpi_recv_wait = 0;
	trans_timer.mpi_send_post = 0;
	trans_timer.mpi_recv_post = 0;
	trans_timer.rcopy = 0;
}

