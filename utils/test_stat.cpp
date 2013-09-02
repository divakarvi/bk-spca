#include "StatVector.hh"

//n=number of items to be inserted
//all numbers inserted are from 0 to 255
void runstatv(int n){
	long int pm = 32452843;
	StatVector v(n);
	for(int i=1; i <= n; i++){
		v.insert(i*pm%256);
	}
	cout<<"median = "<<v.median()<<endl;
	cout<<"mean = "<<v.mean()<<endl;
	cout<<"max = "<<v.max()<<endl;
	cout<<"min = "<<v.min()<<endl;
}

int main(){
	runstatv(100000);
}
