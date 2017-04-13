#include "../../utils/Vector.hh"
#include "Aitken.hh"
#include <cassert>
#include <cstdlib>

void Aitken(Vector& seq1){
	int len = seq1.getSize();
	for(int i=0; i < len-2; i++){
		double a = seq1(i);
		double b = seq1(i+1);
		double c = seq1(i+2);
		seq1(i) = a - (b-a)*(b-a)/(a-2*b+c);
	}
	seq1(len-2) = 0;//invalid entries
	seq1(len-1) = 0;
}

void printseq(const Vector& v){
	printf("\n \n");
	for(int i=0; i < v.getSize(); i++)
		printf("%-.10f\n",v(i));
}

double AitkenE(const Vector& seq, int printflag){
	int len = seq.getSize();
	Vector myseq(len);
	myseq = seq;
	Vector v;
	v.shadow(seq);
	int n = len/2;
	if(len%2==0)
		n--;
	if(printflag==1)
		printseq(v);
	for(int i=0; i < n; i++){
		Aitken(v);
		v.shadow(v, 0, v.getSize()-2);
		if(printflag==1)
			printseq(v);
	}
	int ind = v.getSize()-1; //can be 0 or 1
	return v(ind);
}

