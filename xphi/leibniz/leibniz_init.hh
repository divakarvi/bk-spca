#ifndef __LEIBNIZINITL8DEC2013__
#define __LEIBNIZINITL8DEC2013__

/*
 * returns sum of v[0...len-1]
 */
__declspec(target(mic)) double hostmic_sum(double *v, long len);

/*
 * multiplies each entry of v[0...len-1] by 4^(1/3)
 */
__declspec(target(mic)) void hostmic_scale(double *v, long len);

/*
 * initializes  entries of v[]
 * v[i] = +/-1/(2*i+1.0) for i = 0..len-1
 */
void leibniz_init(double *v, long len);
#endif
