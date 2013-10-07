#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "sumcopy.hh"

void time(){
	cout<<"const stride = "<<STR<<endl;
	
	const long int n = 1024*1024*1024;
	double a[n], b[n];
	const int count = 10;
	for(long  int i=0; i < n; i++)
		a[i] = 1.0*i;
	
	TimeStamp clk;
	StatVector stats(count);
	double cycles;
	if(STR==1){
		for(int i=0; i < count; i++){
			clk.tic();
			double s = sum(a,n);
			cycles = clk.toc();
			stats.insert(cycles);
		}
		stats.print("sum of list");
		cycles = stats.median();
		cout<<"bytes per cycle = "<<8.0*n/cycles<<endl<<endl;
		stats.flush();
	}
	
	int stride = STR;
	for(int i=0; i < count; i++){
		clk.tic();
		double s = sumstride(a,n,stride);
		cycles = clk.toc();
		stats.insert(cycles);
	}
	
	stats.print("sum of list with stride=STR");
	cycles = stats.median();
	cout<<"bytes per cycle = "<<8.0*n/stride/cycles<<endl<<endl;
	stats.flush();
	
	for(int i=0; i < count; i++){
		clk.tic();
		double s = sumconststride(a,n);
		cycles = clk.toc();
		stats.insert(cycles);
	}
	stats.print("sum of list with const stride");
	cycles = stats.median();
	cout<<"bytes per cycle = "<<8.0*n/STR/cycles<<endl<<endl;
	stats.flush();
	
	if(STR==1){
		for(int i=0; i < count; i++){
			clk.tic();
			copy(a,b,n);
			cycles = clk.toc();
			stats.insert(cycles);
		}
		stats.print("copy list to list");
		cycles = stats.median();
		cout<<"bytes per cycle = "<<16.0*n/cycles<<endl<<endl;
		stats.flush();
	}
	
	for(int i=0; i < count; i++){
		clk.tic();
		copyconststride(a,b,n);
		cycles = clk.toc();
		stats.insert(cycles);
	}
	stats.print("copy const stride list to list");
	cycles = stats.median();
	cout<<"bytes per cycle = "<<16.0*n/STR/cycles<<endl<<endl;
	stats.flush();
}

int main(){
	time();
}
