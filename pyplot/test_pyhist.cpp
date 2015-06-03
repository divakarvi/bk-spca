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

#include "../utils/Random.hh"
#include "pyhist.hh"

int main(){
	const int count = 1000*100;
	double x[count];
	Random rng;
	for(int i=0; i < count; i++)
		x[i] = rng.randn();

	PyHist hist("nml");
	hist.hist(x, count);
	hist.bins(100);
	hist.title("histogram of random numbers");
	const char *cmd = 
		"plt.xlabel('pycmd ok')"
		"\n";
        hist.pycmd(cmd);

	hist.show();
}
