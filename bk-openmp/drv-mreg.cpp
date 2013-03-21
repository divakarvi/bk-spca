#include <iostream>
extern void mreg(long *a, long n);

void run1(long n){
  long *a = (long *)malloc(5*sizeof(long));
  printf("a = %p \n", a);
  long pval = (long) a;
  printf("page alignment = %ld \n", pval%4096);
  mreg(a, n);
  free(a);
}

int main(){
  printf("a[0...5)\n");
  printf("a[0...n) accessed\n");
  long n;
  printf("n = ");
  scanf("%ld", &n);
  run1(n);
}
