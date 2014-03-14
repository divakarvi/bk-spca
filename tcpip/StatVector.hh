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

#ifndef __StatVector03July2011__
#define __StatVector03July2011__
#include <algorithm>
#include <iostream>
#include <iomanip>
#include "Vector.hh"
using namespace std;

class StatVector{
  Vector v;
  int sortflag;
  int numitems;
  void dosort(){
    double *p;
    p = v.getRawData();
    sort(p, p+numitems);
    sortflag = 1;
  }
public:
  StatVector(int n):v(n){
    sortflag=-1;
    numitems=0;
  }
  ~StatVector(){};
  void insert(double x){
    assert(numitems < v.getSize());
    v(numitems) = x;
    numitems++;
    sortflag = -1;
  }
  double median(){
    assert(numitems > 0);
    if(sortflag != 1)
      dosort();
    return v(numitems/2);
  }
  double mean(){
    assert(numitems > 0);
    if(sortflag != 1)
      dosort();
    double sum = 0;
    for(int i=0; i < numitems; i++)
      sum += v(i);
    return sum/numitems;
  }
  double max(){
    assert(numitems > 0);
    if(sortflag != 1)
      dosort();
    return v(numitems-1);
  }
  double min(){
    assert(numitems > 0);
    if(sortflag != 1)
      dosort();
    return v(0);
  }
  void flush(){
    sortflag = -1;
    numitems = 0; 
  }
  void print(const char* banner = ""){
    cout<<banner<<endl;
    cout<<setw(10)<<"max: "<<this->max()<<endl;
    cout<<setw(10)<<"mean: "<<this->mean()<<endl;
    cout<<setw(10)<<"median: "<<this->median()<<endl;
    cout<<setw(10)<<"min: "<<this->min()<<endl;
  }
};

//n=number of items to be inserted
//all numbers inserted are from 0 to 255
inline void runstatv(int n){
  long int pm = 32452843;
  StatVector v(n);
  for(int i=1; i <= n; i++){
    v.insert(i*pm%256);
  }
  cout<<"median = "<<v.median()<<endl;
  cout<<"mean = "<<v.mean()<<endl;
  cout<<"max = "<<v.max()<<endl;
  cout<<"min = "<<v.min()<<endl;
}

#endif
