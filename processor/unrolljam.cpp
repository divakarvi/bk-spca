#include <iostream>
#include <cmath>
#include <iomanip>
using namespace std;

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
  const int n = 20;
  double stab[n+1];
  double xlist[n+1];
  sinetable(n, stab);
  double dx =  3.14159265358979323846/(2*n);
  for(int i=0; i <= n; i++)
    xlist[i] = i*dx;
  for(int  i=0; i <= n; i++)
    cout<<stab[i]-sin(i*dx)<<endl;
  cout<<endl<<endl;
  sinetable(n, xlist, stab);
  for(int  i=0; i <= n; i++)
    cout<<stab[i]-sin(i*dx)<<endl;
}

