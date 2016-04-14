#include "Aitken.hh"
#include "../../utils/Vector.hh"
#include <cstdlib>
#include <cmath>


//n terms of Taylor series (x - x^2/2 + x^3/3 -...)
double partialSum(double x, int n){
    double sum = 0;
    double prod = 1;
    for(int i=1; i <= n; i++){
	prod *= x;
	double sign = (i%2==0)?-1:1;
	sum += sign*prod/i;
    }
    return sum;
}

//extrapolate using first n partial sums
double extrapolateSum(double x, int n){
    double sum = 0;
    double prod = 1;
    Vector v(n);
    for(int i=1; i <= n; i++){
	prod *= x;
	double sign = (i%2==0)?-1:1;
	sum += sign*prod/i;
	v(i-1) = sum;
    }
    sum = AitkenE(v);
    return sum;
}

int main(){
  const int N = 11;
  Vector xlist(N+1);
  xlist(N) = 1.25;
  for(int i=0; i < N; i++)
    xlist(i) = 1.0*i/(N-1);
  
  const  int n = 13;
  printf("\tx\tpartial sum\textrapolated sum\ttrue value\n");
  for(int i=0; i < N+1; i++){
    double val1 = partialSum(xlist(i), n);
    double val2 = extrapolateSum(xlist(i), n);
    double val3 = log(1+xlist(i));
    printf("\n\t%.2f\t%.10f\t%.10f\t\t%.10f \n", 
	   xlist(i), val1, val2, val3);
  }
}
