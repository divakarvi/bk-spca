#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include <iostream>
using namespace std;

//partials sums of 4(1-1/3+1/5-1/7+1/9-...)
double leibniz(long int n){
	long int i;
	double ans;
	for(i=0; i < n; i++)
		if(i==0)
			ans = 4.0;
		else if(i%2==1)
			ans -=  4.0/(2.0*i+1);
		else
			ans +=  4.0/(2.0*i+1);
	return ans;
}

double leibnizX(long int n){
	long int i;
	double ans0=4.0;
	double ans1=0;
	for(i=2; i < n; i=i+2)
		ans0 += 4.0/(2.0*i+1);
	for(i=1; i < n; i=i+2)
		ans1 += 4.0/(2.0*i+1);
	return ans0-ans1;
}

double leibnizXX(long int n){
	long int i;
	double ans[10]={0};
	for(i=0; i < n; i+=10){
		ans[0] += 4.0/(2.0*i+1);
		ans[1] += 4.0/(2.0*i+3);
		ans[2] += 4.0/(2.0*i+5);
		ans[3] += 4.0/(2.0*i+7);
		ans[4] += 4.0/(2.0*i+9);
		ans[5] += 4.0/(2.0*i+11);
		ans[6] += 4.0/(2.0*i+13);
		ans[7] += 4.0/(2.0*i+15);
		ans[8] += 4.0/(2.0*i+17);
		ans[9] += 4.0/(2.0*i+19);
	}
	return ans[0]+ans[2]+ans[4]+ans[6]+ans[8]
		-ans[1]-ans[3]-ans[5]-ans[7]-ans[9];
}

int main(){
	long int n = 1000000000;
	double partial_sum;
	TimeStamp clk;
	clk.tic();
	partial_sum = leibniz(n);
	double  intvl = clk.toc();
	cout<<"partial sum = "<<partial_sum<<endl;
	cout<<"cycles per term in series = "<<intvl/n<<endl;
	clk.tic();
	partial_sum = leibnizX(n);
	intvl = clk.toc();
	cout<<"partial sum = "<<partial_sum<<endl;
	cout<<"cycles per term in series = "<<intvl/n<<endl;
	clk.tic();
	partial_sum = leibnizXX(n);
	intvl = clk.toc();
	cout<<"partial sum = "<<partial_sum<<endl;
	cout<<"cycles per term in series = "<<intvl/n<<endl;
}
