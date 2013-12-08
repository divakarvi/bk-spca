#ifndef __MICINIT8DEC2013__
#define __MICINIT8DEC2013__

extern int gl_host_nthreads;
extern int gl_mic_nthreads;

/*
 * OMP_NUM_THREADS --> gl_host_threads --> omp_set_num_threads()
 * MIC_OMP_NUM_THREADS --> gl_mic_threads 
 *                     --> omp_set_num_threads_target() for each mic device
 * returns num of mic devices
 */
void mic_init(int &nmic);
void mic_exit();
#endif

