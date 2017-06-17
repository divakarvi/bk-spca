#include "latency_utils.hh"
#include <cstdlib>

//latency_utils.hh
int countrepeats(long int *list, long int n, int count){
	/*
	 * llist[i] = index accessed through list[] in i-th access.
	 */
	
	long int *llist = (long int *)
		_mm_malloc(count*sizeof(long int), 64);
	llist[0] = 0;
	long int index = 0;
	for(long int i=1; i < count; i++){
		index = list[index]%n;
		index = index - index%8;
		llist[i] = index;
	}

	/*
	 * If access j hits same index as access i, it is a repeat.
	 */
	long int repeats = 0;
	for(int  i=1; i < count; i++){
		for(int j=0; j < i; j++)
			if(llist[j]==llist[i]){
				repeats++;
				break;
			}
	}
	_mm_free(llist);
	return repeats;
}

//latency_utils.hh
//Birthday Problem probability.
double probNoR(long int n, int count){
	double p = 1.0;
	n = n/8;
	for(int i=1; i < count; i++)
		p *= 1.0*(n-i)/n;
	return p;
}

//latency_utils.hh
/*
 * list[i] = i initiallly
 * list[i] exchanged with j, i <= j  < n, j "random"
 */
void random_perm(int *list, int n){
	for(int i=0; i < n; i++)
		list[i] = i;
	for(int i=0; i < n; i++){
		int j = rand()%(n-i)+i;
		int temp = list[j];
		list[j] = list[i];
		list[i] = temp;
	}
}

//latency_utils.hh
void random_cycle(int *list, int n){
	int *tmp = new int[n];
	
	random_perm(tmp, n);
	for(int i=0; i < n; i++)
		list[tmp[i]] = tmp[(i+1)%n];

	delete[] tmp;
}

