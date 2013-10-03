#include <latency_utils.hh>
#include <mkl.h>
#include <cstdlib>

int countrepeats(long int *list, long int n, int count){
	/*
	 * llist[i] = index accessed through list[] in i-th access
	 */
	
	long int *llist = (long int *)
		MKL_malloc(count*sizeof(long int), 64);
	llist[0] = 0;
	long int index = 0;
	for(long int i=1; i < count; i++){
		index = list[index]%n;
		index = index - index%8;
		llist[i] = index;
	}

	/*
	 * if access j hits same index as access i, it is a repeat
	 */
	long int repeats = 0;
	for(int  i=1; i < count; i++){
		for(int j=0; j < i; j++)
			if(llist[j]==llist[i]){
				repeats++;
				break;
			}
	}
	MKL_free(llist);
	return repeats;
}

/*
 * when every access generates a random number in [0..n)
 * i-th access does not repeat with probability (n-i)/n
 * conditioned on none of the earlier accesses being repeats
 * n = size of array
 * count = number of accesses
 * return probability of no repeat access
 */
double probNoR(long int n, int count){
	double p = 1.0;
	n = n/8;
	for(int i=1; i < count; i++)
		p *= 1.0*(n-i)/n;
	return p;
}

/*
 * list[i] = i initiallly
 * list[i] exchanged with j, i <= j  < len, j "random"
 */
void randomp(int *list, int len){
	for(int i=0; i < len; i++)
		list[i] = i;
	for(int i=0; i < len; i++){
		int j = rand()%(len-i)+i;
		int temp = list[j];
		list[j] = list[i];
		list[i] = temp;
	}
}
