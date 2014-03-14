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

#include "Aitken.hh"
#include "../utils/Vector.hh"
#include <cstdlib>

//partials sums of 4(1-1/3+1/5-1/7+1/9-...)
void leibniz(Vector& seq){
  int len = seq.getSize();
  for(int i=0; i < len; i++)
    if(i==0)
      seq(i) = 4.0;
    else if(i%2==1)
      seq(i) = seq(i-1) - 4.0/(2.0*i+1);
    else
      seq(i) = seq(i-1) + 4.0/(2.0*i+1);
}


int main(){
  Vector seq(13);
  leibniz(seq);
  int printflag = 1;
  double ans = AitkenE(seq, printflag);
  printf("extrapolated pi = %.10f \n", ans);
}
