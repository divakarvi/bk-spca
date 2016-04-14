extern "C"{
#include "../aitken/aitken.h"
};
#include "../../utils/utils.hh"
#include "../fft/fft_mkl.hh"

int main(){
	double x[6] = {1, 2*2, 3*3, 4*4, 5*5, 6*6};
	double y[4];

	aitken(x, y, 6);
	array_show(x, 6, "sequence");
	array_show(y, 4, "its aitken transform");

	fft_mkl fft(3);
	fft.fwd(x);
	array_show(x, 6, "its complex fft");
}
