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
	hist.show();
}
