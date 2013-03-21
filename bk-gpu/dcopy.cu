#include <stdlib.h>
#include <stdio.h>

#define DCOPY_THREADS  384
#define DCOPY_DEFLEN   10000000
#define DCOPY_ITER     10           // as in STREAM benchmark

// Macro to catch CUDA errors in CUDA runtime calls
#define CUDA_SAFE_CALL(call)                                          \
do {                                                                  \
    cudaError_t err = call;                                           \
    if (cudaSuccess != err) {                                         \
        fprintf (stderr, "Cuda error in file '%s' in line %i : %s.\n",\
                 __FILE__, __LINE__, cudaGetErrorString(err) );       \
        exit(EXIT_FAILURE);                                           \
    }                                                                 \
} while (0)

// Macro to catch CUDA errors in kernel launches
#define CHECK_LAUNCH_ERROR()                                          \
do {                                                                  \
    /* Check synchronous errors, i.e. pre-launch */                   \
    cudaError_t err = cudaGetLastError();                             \
    if (cudaSuccess != err) {                                         \
        fprintf (stderr, "Cuda error in file '%s' in line %i : %s.\n",\
                 __FILE__, __LINE__, cudaGetErrorString(err) );       \
        exit(EXIT_FAILURE);                                           \
    }                                                                 \
    /* Check asynchronous errors, i.e. kernel failed (ULF) */         \
    err = cudaThreadSynchronize();                                    \
    if (cudaSuccess != err) {                                         \
        fprintf (stderr, "Cuda error in file '%s' in line %i : %s.\n",\
                 __FILE__, __LINE__, cudaGetErrorString( err) );      \
        exit(EXIT_FAILURE);                                           \
    }                                                                 \
} while (0)

// A routine to give access to a high precision timer on most systems.
#if defined(_WIN32)
#if !defined(WIN32_LEAN_AND_MEAN)
#define WIN32_LEAN_AND_MEAN
#endif
#include <windows.h>
double second (void)
{
    LARGE_INTEGER t;
    static double oofreq;
    static int checkedForHighResTimer;
    static BOOL hasHighResTimer;

    if (!checkedForHighResTimer) {
        hasHighResTimer = QueryPerformanceFrequency (&t);
        oofreq = 1.0 / (double)t.QuadPart;
        checkedForHighResTimer = 1;
    }
    if (hasHighResTimer) {
        QueryPerformanceCounter (&t);
        return (double)t.QuadPart * oofreq;
    } else {
        return (double)GetTickCount() * 1.0e-3;
    }
}
#elif defined(__linux__) || defined(__APPLE__)
#include <stddef.h>
#include <sys/time.h>
double second (void)
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (double)tv.tv_sec + (double)tv.tv_usec * 1.0e-6;
}
#else
#error unsupported platform
#endif

__global__ void dcopy (double *src, double *dst, int len)
{
    int stride = gridDim.x * blockDim.x;
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    for (int i = tid; i < len; i += stride) {
        dst[i] = src[i];
    }
}    

struct dcopyOpts {
    int len;
};

static int processArgs (int argc, char *argv[], struct dcopyOpts *opts)
{
    int error = 0;
    memset (opts, 0, sizeof(*opts));
    while (argc) {
        if (*argv[0] == '-') {
            switch (*(argv[0]+1)) {
            case 'n':
                opts->len = atol(argv[0]+2);
                break;
            default:
                fprintf (stderr, "Unknown switch '%c%s'\n", '-', argv[0]+1);
                error++;
                break;
            }
        }
        argc--;
        argv++;
    }
    return error;
}

int main (int argc, char *argv[])
{
    double start, stop, elapsed, mintime;
    double *d_a, *d_b;
    int errors;
    struct dcopyOpts opts;

    errors = processArgs (argc, argv, &opts);
    if (errors) {
        return EXIT_FAILURE;
    }
    opts.len = (opts.len) ? opts.len : DCOPY_DEFLEN;

    /* Allocate memory on device */
    CUDA_SAFE_CALL (cudaMalloc((void**)&d_a, sizeof(d_a[0]) * opts.len));
    CUDA_SAFE_CALL (cudaMalloc((void**)&d_b, sizeof(d_b[0]) * opts.len));
    
    /* Initialize device memory */
    CUDA_SAFE_CALL (cudaMemset(d_a, 0x00, sizeof(d_a[0]) * opts.len)); // zero
    CUDA_SAFE_CALL (cudaMemset(d_b, 0xff, sizeof(d_b[0]) * opts.len)); // NaN

    /* Compute execution configuration */
    dim3 dimBlock(384);
    int threadBlocks = (opts.len + (dimBlock.x - 1)) / dimBlock.x;
    if (threadBlocks > 65520) threadBlocks = 65520;
    dim3 dimGrid(threadBlocks);
    
    printf ("dcopy: operating on vectors of %d doubles (= %.3e bytes)\n", 
            opts.len, (double)sizeof(d_a[0]) * opts.len);
    printf ("dcopy: using %d threads per block, %d blocks\n", 
            dimBlock.x, dimGrid.x);

    mintime = fabs(log(0.0));
    for (int k = 0; k < DCOPY_ITER; k++) {
        start = second();
        dcopy<<<dimGrid,dimBlock>>>(d_a, d_b, opts.len);
        CHECK_LAUNCH_ERROR();
        stop = second();
        elapsed = stop - start;
        if (elapsed < mintime) mintime = elapsed;
    }
    printf ("dcopy: mintime = %.3f msec  throughput = %.2f GB/sec\n",
            1.0e3 * mintime, (2.0e-9 * sizeof(d_a[0]) * opts.len) / mintime);

    CUDA_SAFE_CALL (cudaFree(d_a));
    CUDA_SAFE_CALL (cudaFree(d_b));

    return EXIT_SUCCESS;
}
