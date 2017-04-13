#include "../../utils/utils.hh"
#include "../../utils/Table.hh"
#include <cmath>

//sine table for theta = (pi/(2*n))*i
//i=0,...,n
//thus stab must be of size n+1
void sinetable(int n, double *restrict stab){
	double dx = 3.14159265358979323846/(2*n);
	for(int i=0; i <= n; i++){
		double x =  i*dx;
		stab[i] = 0;
		double si = x;
		for(int j=0; j < 20; j++){
			stab[i] += si;
			si *= -x*x/((2*j+3)*(2*j+2));
		}
	}
}

void sinetable(int n, double *restrict xlist, double *restrict stab){
	for(int i=0; i <= n; i++){
		stab[i] = 0;
		double si = xlist[i];
		for(int j=0; j < 20; j++){
			stab[i] += si;
			si *= -xlist[i]*xlist[i]/((2*j+3)*(2*j+2));
		}
	}
}


int main(){
	const int n = 10;
	double slist[4*(n+1)];
	double xlist[n+1];
	sinetable(n, slist);
	double dx = PI/(2*n);
	
	for(int i=0; i <= n; i++){
		xlist[i] = i*dx;
		slist[n+1+i] = sin(i*dx) - slist[i];
	}

	sinetable(n, xlist, slist+2*(n+1));
	for(int  i=0; i <= n; i++)
		slist[3*(n+1)+i] = sin(i*dx) - slist[2*(n+1)+i];

	Table table;
	table.dim(n+1, 4);
	const char* rows[] = {"0", "1", "2", "3", "4", 
			    "5", "6", "7", "8", "9", "10"};
	const char* cols[] = {"sine", "error", "sine", "error"};
	table.rows(rows);
	table.cols(cols);
	table.data(slist);
	table.print("sine of i*pi/20, i=0...20");
}


