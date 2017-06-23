#include <stdio.h>

extern void aitken_(double * seq1, double * seq2, int * len);
extern void printseq_(double* seq, int * len);
extern double aitkenextrapolate_(double* seq1, double* seq2, int * len);


//seq[0..len-1]: filled with partials sums of 4(1-1/3+1/5-1/7+1/9-...).
void leibniz(double* seq, int len){
	int i;
	for(i=0; i < len; i++)
		if(i==0)
			seq[i] = 4.0;
		else if(i%2==1)
			seq[i] = seq[i-1] - 4.0/(2.0*i+1);
		else
			seq[i] = seq[i-1] + 4.0/(2.0*i+1);
}


int main(){
	const int len = 13;
	double seq1[len];
	double seq2[len];
	int n, i, j;
	int farg;
	leibniz(seq1, len);
	n = len/2;
	if(len%2==0)
		n--;
	
	for(i=0; i < n; i++){
		farg = len-2*i;
		printseq_(seq1,&farg);
		aitken_(seq1, seq2, &farg);
		for(j=0; j < len-2*(i+1); j++)
			seq1[j] = seq2[j];
	}
	if(len%2==0){
		farg = 2;
		printseq_(seq1, &farg);
	}
	else{
		farg = 1;
		printseq_(seq1, &farg);
	}
}

