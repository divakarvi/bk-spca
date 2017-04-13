#include "leibniz.hh"

double leibniz(long int n){
	long int i;
	double ans=4.0;
	for(i=1; i < n; i=i+2){
		ans -= 4.0/(2.0*i+1);
		ans += 4.0/(2.0*i+3);
	}
	return ans;
}

