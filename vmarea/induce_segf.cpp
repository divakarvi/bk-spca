#include "segf.hh"
#include <cstdio>
#include <unistd.h>
#include <asm/unistd.h>

//segf.hh.
void sum_arr(long *p, long len){
	long ans=0;
	for(long i=0; i < len; i++)
		ans += p[i];
	printf("sum = %ld\n",ans);
}

/*
 * list[i] goes up to 5000 whereas a0[] in f0() has only 1000 entries.
 * a0[list[i]]=list[i]*list[i] in ff0() called by f0().
 * The effect is to go past vm_end and trigger a seg fault.
 */
void run1(){
	long *list = new long[5000];
	for(int i=0; i < 5000; i++)
		list[i] = i;
	f0(list, 5000);
	delete[] list;
}

/*
 * f1() defines a1[] with 10**6 entries on the stack. 
 * f1() then calls f0().
 * f0() defines a0[0..999] and calls ff0().
 * ff0() does a0[list[i]] = list[i]*list[i].
 * All accesses within vm_area this time.
 * However, ff0() overwrites %rsi saved by f0() to return to f1().
 */
void run2(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = i;
	f1(list, 2000);
	delete[] list;
}

/*
 * f1() defines a1[] to have 10**6 entries, intlzd to zero.
 * f1() then calls f0().
 * f0() defines a0[0..999], intlzd to zero.
 * f0() then calls ff0().
 * ff0() does a0[list[i]] = list[i]*list[i].
 * All accesses within vm_area because of room created by a1[].
 * Spacing in list[] entries ensures %rsi is not overwritten.
 * However, ff0() modifies entries of a1[].
 * ff0() prints a1[] sum to be \sum_{i=0}^{1999}(i+10000)^2.
 * No memory error this time.
 */
void run3(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = i+10000;
	f1(list, 2000);
	delete[] list;
}

/*
 * Overwrites %rsi saved by ff0() to return to f0().
 */
void run4(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = -i;
	f0(list, 2000);
	delete[] list;
}

/*
 * Same setting as in run4().
 * Spacing ensures %rsi saved by ff0() to return to f0() is not overwritten.
 * However, the a0[] accesses go past vm_begin.
 * No memory error, however.
 */
void run5(){
	long *list = new long[200000];
	for(int i=0; i < 200000; i++)
		list[i] = -i-100;
	f0(list, 200000);
	delete[] list;
}

/*
 * Same as run5(), but vm_begin is not crossed.
 * That is becuase the call to f2() expands the stack.
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
	printf("\nStack grows downward from a high address.\n\n");
	printf("If [stack_begin, stack_end] is the vm area, \n");
	printf("then stack starts near stack_end grows "
	       "towards stack_begin.\n\n");
	printf("run1(): goes beyond stack_end, seg faults.\n");
	printf("run2(): within stack_end, but overwrites return addr.\n");
	printf("run3(): within stack_end and jumps over return addr."
	       " No memory error reported.\n");
	printf("run4(): toward and within stack_begin, "
	       "but overwrites return addr.\n");
	printf("run5(): toward and beyond stack_begin,"
	       " does not overwrite %%rsi, no memory error reported.\n");
	printf("run6(): toward stack_begin, no %%rsi overwrite, "
	       "stack_begin not crossed because of prior call.\n");
	
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



