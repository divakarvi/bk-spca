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

#include "nr.hh"
#include <cmath>

//From Numerical Recipes in C, 2nd edition, p. 507
#define SWAP(a,b) tempr=(a);(a)=(b);(b)=tempr
static void four1(double data[], unsigned long nn, int isign){
	unsigned long n, mmax, m, j, istep, i;
	double wtemp, wr, wpr, wpi, wi, theta;
	double tempr, tempi;
  
	n=nn<<1;
	j=1;
	for(i=1;i<n;i+=2){
		if(j>i){
			SWAP(data[j],data[i]);
			SWAP(data[j+1],data[i+1]);
		}
		m=n>>1;
		while(m>=2 && j > m){
			j -= m;
			m >>= 1;
		}
		j += m;
	}
	mmax=2;
	while(n > mmax){
		istep=mmax<<1;
		theta=isign*(6.28318530717959/mmax);
		wtemp=sin(0.5*theta);
		wpr = -2.0*wtemp*wtemp;
		wpi=sin(theta);
		wr=1.0;
		wi=0.0;
		for(m=1;m<mmax;m+=2){
			for(i=m; i<=n;i+=istep){
				j=i+mmax;
				tempr=wr*data[j]-wi*data[j+1];
				tempi=wr*data[j+1]+wi*data[j];
				data[j]=data[i]-tempr;
				data[j+1]=data[i+1]-tempi;
				data[i]+=tempr;
				data[i+1]+=tempi;
			}
			wr=(wtemp=wr)*wpr-wi*wpi+wr;
			wi=wi*wpr+wtemp*wpi+wi;
		}
		mmax=istep;
	}
}

void nrfwd(double *f, unsigned long n){
	four1(f-1, n, -1);
	for(unsigned long j=0; j < 2*n; j++)
		f[j] /= n*1.0;
}

void nrbwd(double *f, unsigned long n){
	four1(f-1, n, 1);
}
