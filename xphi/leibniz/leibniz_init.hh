/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#ifndef __LEIBNIZINITL8DEC2013__
#define __LEIBNIZINITL8DEC2013__

/*
 * returns sum of v[0...len-1]
 */
__declspec(target(mic)) double mic_sum(double *v, long len);

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
