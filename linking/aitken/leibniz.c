#include "aitken.h"
#include <stdio.h>

//seq[0..len-1]: filled with partials sums of 4(1-1/3+1/5-1/7+1/9-...)
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

void printseq(double* seq, int len){
	int i;
	printf("\n \n");
	for(i=0; i < len; i++)
		printf("%-.10f\n",seq[i]); 
}

int main(){
	const int len = 13;
	double seq1[len];
	double seq2[len];
	int n, i, j;
	leibniz(seq1, len);
	n = len/2;
	if(len%2==0)
		n--;
	
	for(i=0; i < n; i++){
		printseq(seq1,len-2*i);
		aitken(seq1, seq2, len-2*i);
		for(j=0; j < len-2*(i+1); j++)
			seq1[j] = seq2[j];
	}
	if(len%2==0)
		printseq(seq1, 2);
	else
		printseq(seq1, 1);
}

