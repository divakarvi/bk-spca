#ifndef __OFFL8DEC2013__
#define __OFFL8DEC2013__

/*
 * initialize v[0..len-1] to mic device number/ -1 if on host
 */
__declspec(target(mic)) void dummy(double *v, long len);

/*
 * does nothing 
 */
__declspec(target(mic)) void dummyx(double *v, long len);

/*
 * xfer v[0..n-1]
 * nmic = num of mic devices
 * xfer direction = in 
 */
void xfer_in(double *v, long n, int nmic);
/*
 * xfer direction = out
 */
void xfer_out(double *v, long n, int nmic);
/*
 * xfer direction = in and out
 */
void xfer_inout(double *v, long n, int nmic);
#endif
