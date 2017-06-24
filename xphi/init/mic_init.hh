#ifndef MICINIT8DEC2013
#define MICINIT8DEC2013

extern int gl_host_nthreads;
extern int gl_mic_nthreads;

/*
 * cycle factor: 2.70/1.10 for stampede.
 * GHz of host/GHz of mic device.
 */
#define MIC_CYCLE_FACTOR (2.4545454545454545)

/*
 * OMP_NUM_THREADS --> gl_host_threads --> omp_set_num_threads()
 * MIC_OMP_NUM_THREADS --> gl_mic_threads 
 *                     --> omp_set_num_threads_target() for each mic device
 * nmic: num of mic devices.
 */
void mic_init(int &nmic);
void mic_exit();
#endif


