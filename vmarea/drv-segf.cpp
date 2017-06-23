#include <cstdio>
#include <unistd.h>
#include <asm/unistd.h>

extern void ff0(long *a0, long *list, long n);
extern void f1(long *list, long n);
extern void f2();

void sum_arr(long *p,long len){
	long ans=0;
	for(long i=0; i < len; i++)
		ans += p[i];
	printf("sum = %ld\n",ans);
}

void f0(long *list, long n){
	long a0[1000];
	printf("a0 (in f0)= %p\n", a0);
	for(int i=0; i < 1000; i++)
		a0[i] = 0;
	asm volatile("cpuid"::"a"(0x01):"ebx", "ecx","edx");
	printf("pid (in f0) = %ld\n", getpid());
	ff0(a0, list, n);
}

void run1(){
	long *list = new long[5000];
	for(int i=0; i < 5000; i++)
		list[i] = i;
	f0(list, 5000);
	delete[] list;
}


void run2(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = i;
	f1(list, 2000);
	delete[] list;
}


void run3(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = i+10000;
	f1(list, 2000);
	delete[] list;
}

void run4(){
	long *list = new long[2000];
	for(int i=0; i < 2000; i++)
		list[i] = -i;
	f0(list, 2000);
	delete[] list;
}

void run5(){
	long *list = new long[200000];
	for(int i=0; i < 200000; i++)
		list[i] = -i-100;
	f0(list, 200000);
	delete[] list;
}

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
	printf("run3(): upward from st ptr, within stack_end avoiding %rip\n");
	printf("run4(): downward from st ptr, within stack_begin, overwrite %rip\n");
	printf("run5(): downward from st ptr, beyond stack_begin\n");
	printf("run6(): downward from st ptr, within stack_begin, no %rip overwrite\n");

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



