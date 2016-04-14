#include <iostream>

template<class Num> Num sum(Num *arr, int len){
	Num ans;
	ans = 0;
	for(int i=0; i < len; i++)
		ans += arr[i];
	return ans;
}

int main(){
	int x[5] = {1, 2, 3, 4, 5};
	std::cout<<"1 + ... + 5 = "<<sum(x, 5)<<std::endl;
	double y[5] = {6, 7, 8, 9, 10};
	std::cout<<"6 + ... + 10 = "<<sum(y, 5)<<std::endl;
}
