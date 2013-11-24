#include "timer.hh"

struct trans_timer_struct trans_timer;

void zero_trans_timer(){
	trans_timer.scopy = 0;
	trans_timer.mpi = 0;
	trans_timer.rcopy = 0;
}
