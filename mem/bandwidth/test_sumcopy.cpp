#include "sumcopy.hh"
#include <iostream>

using namespace std;

void testall(){
	const long int n = 10;
	double a[n], b[n];

	for(int i=0; i < n; i++)
		a[i] = i;

	cout<<"a = 0, 1, ..., 9"<<endl;
	cout<<"stride = 1, sum = "<<sum(a,n)<<endl;
	cout<<"stride = 3, sum = "<<sumstride(a,n,3)<<endl;
	cout<<"STR = "<<STR<<", sum = "<<sumconststride(a,n)<<endl<<endl;

	cout<<"copy a to b:"<<endl;
	copy(a, b, n);
	for(int i=0; i < n; i++){
		cout<<b[i]<<" ";
		b[i] = -1;
	}
	cout<<endl;
	copyconststride(a, b, n);
	cout<<"const STR = "<<STR<<endl;
	for(int i=0; i < n; i++)
		cout<<b[i]<<" ";
	cout<<endl<<endl;
}

int main(){
	testall();
}
