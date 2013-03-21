#include <iostream>
#include <cmath>
#include <iomanip>
using namespace std;

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
  cout<<"double x = ";
  double x;
  cin>>x;
  cout<<"int n = ";
  int n;
  cin>>n;
  double c, s;
  sincos(x, n, c, s);
  cout.precision(15);
  cout.setf(ios::scientific, ios::floatfield);
  cout<<"sin(x) = "<<setw(25)<<s<<" "<<setw(25)<<sin(x)<<endl;
  cout<<"cos(x) = "<<setw(25)<<c<<" "<<setw(25)<<cos(x)<<endl;
}
