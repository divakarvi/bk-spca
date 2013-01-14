#include <unistd.h>
#include <pthread.h>
#include <stdio.h>
#include <iostream>
using namespace std;
const int NTHREADS=10;

struct leib_info{
  int offset;
  int n;
  double sum;
};

void *leibniz(void *arg){
  int offset = ((struct leib_info *)arg)->offset;
  int n = ((struct leib_info *)arg)->n;
  double sum = 0;
  for(int i=offset; i < n; i += NTHREADS)
    sum += 4.0/(2*i+1);
  ((struct leib_info *)arg)->sum = sum;
  return arg;
}

double leibsum(int nterms){
  pthread_t t[NTHREADS-1];
  struct leib_info linfo[NTHREADS-1];
  for(int i=1; i < NTHREADS; i++){
    linfo[i-1].offset = i;
    linfo[i-1].n = nterms;
    pthread_create(&(t[i-1]), NULL, leibniz, (void *)(linfo+(i-1)));
  }
  double ans = 0;
  for(int i=0; i < nterms; i+=NTHREADS)
    ans += 4.0/(2*i+1);
  void *res;
  pthread_join(t[0], &res);
  ans -= ((struct leib_info *)res)->sum;
  for(int i=2; i < NTHREADS; i+=2){
    pthread_join(t[i-1], &res);
    ans += ((struct leib_info *)res)->sum;
    pthread_join(t[i], &res);
    ans -= ((struct leib_info *)res)->sum;
  }
  return ans;
}
