#include <stdio.h>

void hanoi(int from, int to, int n){
  int other = 3-(from+to);
  if(n==1)
    printf("move from %d to %d \n", from, to);
  else{
    hanoi(from, other, n-1);
    printf("move from %d to %d \n", from, to);
    hanoi(other, to, n-1);
  }
}

int main(){
  int n;
  printf("n = ");
  scanf("%d", &n);
  hanoi(0, 1, n);
}
