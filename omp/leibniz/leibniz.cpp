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

#include "leibniz.hh"

double leibniz(long int n){
	long int i;
	double ans=4.0;
#pragma vector always
	for(i=1; i < n; i=i+2){
		ans -= 4.0/(2.0*i+1);
		ans += 4.0/(2.0*i+3);
	}
	return ans;
}
