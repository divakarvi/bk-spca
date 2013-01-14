#include "multasm.hh"
#include <cassert>
#include <iostream>
using namespace std;
//a=4x200
//b=200x12
//c=4x12
void mult4x200x12(double *a, double *b, double *c){
  asm4x200x4(a, b, c);
  asm4x200x4(a,b+800,c+16);
  asm4x200x4(a,b+1600,c+32);
}

/*
void unpackC(double *c, double *C,  int ldC){
  for(int j=0; j < 12; j++){
    double *p = c+600*j;
    double *q = C+ldC*j;
    for(int i=0; i < 600; i++)
      q[i] += p[i];
  }
}
*/


void unpackC(double *c, double *C, int ldC){
  for(int i=0; i < 600; i+= 4)
    for(int ii=0; ii < 12; ii++)
      for(int iii=0; iii<4; iii++)
	C[i+iii+ii*ldC] += c[12*i+4*ii+iii];
}


		     
void mult600x200x12(double *a, double *b, 
		    double *C, int ldC,
		    double *scratch){
  double *c = scratch;
  for(int i=0; i < 7200; i++)
    c[i] = 0;
  for(int  i=0; i < 150; i++)
    mult4x200x12(a+i*800, b, c+i*48);
  unpackC(c, C, ldC);
}

/*
void packA(double *A, int ldA, double *a){
  const int B = 40;
  for(int j=0; j < 200; j+=B)
    for(int i=0; i < 600; i+=B)
      for(int jj=0; jj < B; jj++)
	for(int ii=0; ii < B; ii++){
	  int I = i+ii;
	  int J = j+jj;
	  int k = (I/4)*800+(I%4+J*4);
	  a[k] = A[I+J*ldA];
	}
}
*/

void packA(double *A, int ldA, double *a){
  for(int j=0; j < 200; j++)
    for(int i=0; i < 150; i++)
      for(int ii=0; ii < 4; ii++)
	a[i*800+ii+j*4] = A[4*i+ii+j*ldA];
}

void mult600x200x3000(double *A, int ldA,
		      double *b,
		      double *C, int ldC,
		      double *scratch){
  double *a = scratch;
  scratch += 600*200;
  packA(A, ldA, a);
  for(int i=0; i < 250; i++)
    mult600x200x12(a, b+i*2400, C+i*12*ldC, ldC, scratch);
}

/*
void packB(double *B, int ldB, double *b){
  for(int j=0; j < 3000; j+=4)
    for(int i=0; i < 200; i+=4)
      for(int jj=0; jj < 4; jj++)
	for(int ii=0; ii < 4; ii++)
	  b[(i+jj)+(j+ii)*200] = B[(i+ii)+(j+jj)*ldB];

}
*/

void packB(double *B, int ldB, double *b){
  for(int j=0; j < 750; j++)
    for(int i=0; i < 200; i++)
      for(int jj=0; jj < 4; jj++){
	b[jj+i*4+j*800] = B[i+(4*j+jj)*ldB];
      }

}

void mult3000x200x3000(double *A, int ldA,
		       double *B, int ldB,
		       double *C, int ldC,
		       double *scratch){
  double *b = scratch;
  scratch += 200*3000;
  packB(B, ldB, b);
  for(int i=0; i < 5; i++)
    mult600x200x3000(A+i*600, ldA, b, C+i*600, ldC, scratch);
}

void blockmult(double *A, double *B, double *C,
	       int l, int m, int n,
	       double *scratch){
  assert(l%3000==0);
  assert(m%200==0);
  assert(n%3000==0);
  
  int ldA = l;
  int ldB = m;
  int ldC = l;
  
  l = l/3000;
  m = m/200;
  n = n/3000;
  for(int i=0; i < l; i++)
    for(int j=0; j < m; j++)
      for(int k=0; k < n; k++){
	double *AA = A + (i*3000)+(j*200)*ldA;
	double *BB = B + (j*200)+(k*3000)*ldB;
	double *CC = C + (i*3000)+(k*3000)*ldC;
	mult3000x200x3000(AA, ldA, BB, ldB, CC, ldC, scratch);
      }
}
