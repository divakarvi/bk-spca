#include "segf.hh"
#include <cstdio>
#include <unistd.h>
#include <asm/unistd.h>

void sum_arr(long *p, long len){
	long ans=0;
	for(long i=0; i < len; i++)
		ans += p[i];
	printf("sum = %ld\n",ans);
}

/*
 * a0 defined by f0() assumed to be within 40K bytes of vm area end 
 * upward from stack locn, beyond stack_end
 */
void run1(){
	long *list = new long[5000];
	for(int i=0; i < 5000; i++)
		list[i] = i;
	f0(list, 5000);
	delete[] list;
}

/*
 * there is no assumption about vm area here
 * upward from stack locn, within stack_end 
 * overwrite saved %rsi
 * saved %rsi is for f0() to return to f1()
 */
void run2(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = i;
	f1(list, 2000);
	delete[] list;
}

/*
 * there is no assumption about vm area here
 * upward from stack locn, within stack_end, skip past saved %rsi
 * saved %rsi is for f0() to return to f1()
 */
void run3(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = i+10000;
	f1(list, 2000);
	delete[] list;
}

/*
 * downward from a0 defined by f0() on stack
 * overwrites %rsi saved on stack
 * saved %rsi is for ff0() to return to f0()
 */
void run4(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = -i;
	f0(list, 2000);
	delete[] list;
}

/*
 * downward from a0 defined by f0() on stack
 * goes beyond stack_begin of vm area
 * does not overwrite saved %rsi
 * saved %rsi is for ff0() to return f0()
 */
void run5(){
	long *list = new long[200000];
	for(int i=0; i < 200000; i++)
		list[i] = -i-100;
	f0(list, 200000);
	delete[] list;
}

/*
 * same as above but stack_begin is not crossed if called after run5()
 */
void run6(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = -i-1000*100;
	f2();
	f0(list, 2000);
	delete[] list;
}


int main(){
	printf("run1(): upward from st ptr, beyond stack_end\n");
	printf("run2(): upward from st ptr, within stack_end\n");
	printf("run3(): upward from st ptr,"
	       " within stack_end avoiding saved %%rsi\n");
	printf("run4(): downward from st ptr,"
	       " within stack_begin, overwrite %%rsi\n");
	printf("run5(): downward from st ptr, beyond stack_begin,"
	       " does not overwrite %%rsi\n");
	printf("run6(): downward from st ptr,"
	       " within stack_begin, no %%rsi overwrite\n");
	
	int i;
	printf("run = ");
	scanf("%d", &i);
	switch(i){
	case 1:
		run1();
		break;
	case 2:
		run2();
		break;
	case 3:
		run3();
		break;
	case 4:
		run4();
		break;
	case 5:
		run5();
		printf("getpid() again = %ld \n", syscall(__NR_getpid));
		break;
	case 6:
		run6();
		break;
	}
}


