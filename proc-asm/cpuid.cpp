/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include "../utils/TimeStamp.hh"
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cassert>
using namespace std;


void cpuid01h(){
	cout<<endl<<endl;
	cout<<"\t\tCPUID with code 01h"<<endl;
	unsigned int eax;
	asm volatile("cpuid":"=a"(eax):"a"(0x01):"ebx", "ecx","edx");
	printf("(deciphered below) eax = %x \n", eax);
	printf("\textended family\t= %x\n", 0xFF & (eax>>20));
	printf("\textended model\t= %x\n", 0xF & (eax>>16));
	printf("\tprocessor type\t= %x\n", 0x3 & (eax>>12));
	printf("\tfamily code\t= %x\n", 0xF & (eax>>8));
	printf("\tmodel number\t= %x\n", 0xF&(eax>>4));
	printf("\tstepping id\t= %x\n", 0xF & eax);  
}

void cpuid02h(){
	cout<<endl<<endl;
	cout<<"\t\tCPUID with code 02h"<<endl;
	unsigned int eax, ebx, ecx, edx;
	asm volatile("cpuid"
		     :"=a"(eax), "=b"(ebx), "=c"(ecx), "=d"(edx)
		     :"a"(0x02));
	cout<<"number of calls to extract TLB parameters = "
	    <<(0xFF&eax)<<endl;
	if(((eax<<1)&0x1)==0){
		cout<<"\t\teax is valid"<<endl;
		printf("\t\tcodes = %x %x %x\n", 
		       (eax>>24)&0xFF,
		       (eax>>16)&0xFF,
		       (eax>>8)&0xFF);
		
	}
	if(((ebx<<1)&0x1)==0){
		cout<<"\t\tebx is valid"<<endl;
		printf("\t\tcodes = %x %x %x %x \n", 
		       (ebx>>24)&0xFF,
		       (ebx>>16)&0xFF,
		       (ebx>>8)&0xFF,
		       ebx&0xFF);
		
	}
	if(((ecx<<1)&0x1)==0){
		cout<<"\t\tecx is valid"<<endl;
		printf("\t\tcodes = %x %x %x %x \n", 
		       (ecx>>24)&0xFF,
		       (ecx>>16)&0xFF,
		       (ecx>>8)&0xFF,
		       ecx&0xFF);
		
	}
	if(((edx<<1)&0x1)==0){
		cout<<"\t\tedx is valid"<<endl;
		printf("\t\tcodes = %x %x %x %x \n", 
		       (edx>>24)&0xFF,
		       (edx>>16)&0xFF,
		       (edx>>8)&0xFF,
		       edx&0xFF);
		
	}
	cout<<"from cpuid manual"<<endl;
	cout<<"ca = 2nd level tlb, 512 entries, 4 way associative"<<endl;
	cout<<"b0 = instruction tlb 128 entries, 4 way associative"<<endl;
	cout<<"f0 = 64 byte prefetch"<<endl;
	cout<<"03 = 64 entry 4 way dtlb"<<endl;
	cout<<"5a and 55 apply to very large page sizes"<<endl;
	cout<<"ff is not listed"<<endl;
}


void cpuid04h(){
	cout<<endl<<endl;
	cout<<"\t\tCPUID with code 04h"<<endl;
	unsigned int eax, ebx, ecx;
	for(int i=0;;i++){
		asm volatile("cpuid"
			     :"=a"(eax), "=b"(ebx), "=c"(ecx)
			     :"a"(0x04), "c"(i):"edx");
		if((eax&0xF)==0)
			break;
		printf("               call number = %d\n", i);
		printf("                cache type = %x\n", eax&0xF);
		printf("               cache level = %x\n", (eax>>5)&(0x7));
		printf("     ways of associativity = %u\n",
		       ((ebx>>22)&0xFFF)+1);
		printf("  physical line partitions = %x\n", 
		       ((ebx>>12)&0x3FF)+1);
		printf("           cache line size = %u\n",(ebx&0xFFF)+1);
		printf("            number of sets = %u\n",ecx+1);
		printf("       cache size in bytes = %u\n\n",
		       (((ebx>>22)&0xFFF)+1)* //ways of associativity
		       (((ebx>>12)&0x3FF)+1)* //physical line partns
		       ((ebx&0xFFF)+1)* //cache line size
		       (ecx+1)); //number of sets
	}
}

void cpuid0Ah(){
	cout<<endl<<endl;
	cout<<"\t\tCPUID with code 0Ah"<<endl;
	unsigned int eax, ebx, edx;
	asm volatile("cpuid"
		     :"=a"(eax), "=b"(ebx), "=d"(edx)
		     :"a"(0x0A)
		     :"ecx");
	printf("         (deciphered below) eax = %x \n", eax);
	printf("         (events supported) ebx = %x \n", ebx);
	printf("           (fixed counters) edx = %x \n", edx);
	unsigned int mask = 0xFF;
	unsigned int result;
	result = mask & eax;
	printf("           arch perfmon version = %u\n", result);
	result = mask & (eax>>8);
	printf("    number of counters per core = %u\n", result);
	result = mask & (eax>>16);
	printf("          counter width in bits = %u\n",result);
	result = mask & (eax>>24);
	printf("number of arch events supported = %u\n",result);
}


void cpuidHT(){//check hyper threading
	cout<<endl<<endl;
	cout<<"CPUID to check HT"<<endl;
	unsigned int eax, ebx;
	asm volatile("cpuid":"=a"(eax),"=b"(ebx):"a"(0x01):"ecx","edx");
	int numofcores = (ebx>>16)&&0xFF;
	cout<<"num of cores = "<<numofcores<<endl<<endl;
	for(int i=0;i < 6;i++){
		asm volatile("cpuid":"=a"(eax):"a"(0x04), "c"(i):"ebx","edx");
		if((eax&0xF)==0)
			break;
		int numofapic = (eax>>26)&0x3F;
		numofapic++;
		int numofthreads = (eax>>14)&0xFFF;
		numofthreads++;
		cout<<"num of apic ids reserved = "<<numofapic<<endl;
		cout<<"num of threads = "<<numofthreads<<endl;
		cout<<endl;
	}
}

int main(){
	//cpuid01h();
	//cpuid02h();
	//cpuid04h();
	//cpuid0Ah();
	cpuidHT();
}
