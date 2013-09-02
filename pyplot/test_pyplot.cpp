#include <iostream>
#include <iomanip>
#include <cmath>
#include "../utils/utils.hh"
#include "../utils/StatVector.hh"
#include "../utils/TimeStamp.hh"
#include "pyplot.hh"


void test1(){
	PyPlot plt("trig");
	const int N = 400;
	double x[N];
	double y[N];
	for(int i=0; i < N; i++){
		x[i] = 6*PI*i/N;
		y[i] = sin(x[i]);
	}
	plt.plot(x, y, N);
	plt.linestyle("--");
	plt.linewidth("3");
	plt.linecolor("red");


	for(int i=0; i < N/10; i++){
		x[i] = 6*PI*i/(N/10);
		y[i] = sin(x[i]);
	}
	plt.plot(x, y, N/10);
	plt.linestyle("None");
	plt.markertype("o");
	plt.markersize("7");
	plt.markercolor("black");

	plt.axis(0, 15, -2, 2);
	plt.title("sin(x) vs. x");
	double xticks[6] = {0, 1.6, 1.6+3.2, 1.6+6.4, 1.6+9.6, 
			    1.6+4*3.2};
	double yticks[5] = {-0.75, -0.5, 0, 0.5, 0.75};
	plt.xticks(xticks, 6);
	plt.yticks(yticks, 5);
	//plt.ticksize("20");

	plt.show();
	plt.savescript();
}

void makeplot(double *x, double *y, int n, const char *name){
	PyPlot plt(name);
	plt.plot(x, y, n);
	plt.output();
}

/*
 * make n plots and time them
 * plot k is called sink
 * it is a plot of sin(kx) vs. x
 */
void timeplot(int n){
	double x[n*10];
	double y[n*10];
	StatVector stats(n);
	TimeStamp clk;
	for(int i=1; i <= n; i++){
		char name[30];
		sprintf(name, "sin%d", i);
		for(int j=0; j < n*10; j++){
			x[j] = 2*PI*i*j/(n*10.0);
			y[j] = sin(x[j]*i);
		}
		clk.tic();
		makeplot(x, y, 10*n, name);
		double cycles = clk.toc();
		stats.insert(cycles);
	}
	char banner[200];
	sprintf(banner, "cycle stats for %d plots", n);
	stats.print(banner);
	system("rm FIGS/sin*.eps");
}

int main(){
	test1();
	//timeplot(100);
}
