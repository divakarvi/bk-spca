#ifndef OFFL8DEC2013
#define OFFL8DEC2013

/*
 * Initializes v[0..len-1] to mic device number/ -1 if on host.
 */
__declspec(target(mic)) void dummy(double *v, long len);

/*
 * Does nothing.
 */
__declspec(target(mic)) void dummyx(double *v, long len);

/*
 * With fst[i] being i*n/nmic,
 * array section v[fst[i]..fst[i+1]-1] is allocated on mic device #i.
 */
void alloc_micmem(double *v, long n, int nmic);

/*
 * With fst[i] being i*n/nmic,
 * array section v[fst[i]..fst[i+1]-1] is freed on mic device #i.
 */
void free_micmem(double *v, long n, int nmic);

/*
 * xfers v[0..n-1].
 * nmic: num of mic devices.
 * xfer direction is in. 
 * Memory on mics is neither allocated not freed.
 */
void xfer_in(double *v, long n, int nmic);

/*
 * xfer direction is out. Same as above, otherwise.
 */
void xfer_out(double *v, long n, int nmic);

/*
 * xfer direction is in and out. Same as above, otherwise.
 */
void xfer_inout(double *v, long n, int nmic);
#endif

