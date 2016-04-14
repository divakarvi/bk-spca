#include "../../utils/utils.hh"
#include "../../utils/Table.hh"

void sincos(double x, int n, double& c, double& s){
	c = s = 0;
	double ci = 1;
	for(int i=0; i<n; i++){
		c += ci;
		ci *= -x*x/(2.0*i+2)/(2.0*i+1);
	}
	double si = x;
	for(int i=0; i<n; i++){
		s += si;
		si *= -x*x/(2.0*i+3)/(2.0*i+2);
	}
}

int main(){
	const int N = 4;
	double x[N] = {0, PI/4, PI/2, PI};
	int n = 10;
	double sx[2*N];
	double *cx = sx+N;
	for(int i=0; i < N; i++)
		sincos(x[i], n, sx[i], cx[i]);
	
	Table table;
	table.dim(4, 2);
	const char *cols[] = {"sin", "cos"};
	const char *rows[] = {"0", "pi/4", "pi/2", "pi"};
	table.rows(rows);
	table.cols(cols);
	table.data(sx);
	table.print("sines and cosines");
	
}
