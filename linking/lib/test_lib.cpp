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

extern "C"{
#include "../aitken/aitken.h"
};
#include "../../utils/utils.hh"
#include "../fft/fft_fftw.hh"

int main(){
	double x[6] = {1, 2*2, 3*3, 4*4, 5*5, 6*6};
	double y[4];

	aitken(x, y, 6);
	array_show(x, 6, "sequence");
	array_show(y, 4, "its aitken transform");

	fft_fftw fft(3);
	fft.fwd(x);
	array_show(x, 6, "its complex fft");
}
