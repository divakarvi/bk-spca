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

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int global;

void f(){
  double farray[512];
  printf(" farray = %p\n", farray);
}

int main(){
  double marray[512];
  printf(" marray = %p\n", marray);
  f();
  printf("\n");
  double *ptr;
  ptr = (double *)malloc(1000);
  printf("    ptr = %p\n", ptr);    
  printf("\n");
  printf("&global = %p\n", &global);
  printf("      f = %p\n", &f);
  printf("   main = %p\n", &main);
  free(ptr);
}
