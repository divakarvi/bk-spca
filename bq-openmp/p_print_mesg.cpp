#include <pthread.h>
#include <iostream>
#include <cstdio>
using namespace std;

void *print_message(void *arg){
  char *s = (char *)arg;
  char ss[400];
  int l = strlen(s);
  for(int i=0; i < l; i++){
    ss[2*i] = s[i];
    ss[2*i+1] = (s[i]==' ')?' ':'_';
  }
  ss[2*l] ='\0';
  printf("%s",s);
  printf("\n");
  printf("%s", ss);
  printf("\n");
  printf("ss = %p \n\n", (void *)ss);
  return NULL;
}


void drive_pthreads(){
  pthread_t thread1, thread2, thread3;
  char s[600];
  sprintf(s, "Message for thread1");
  sprintf(s+200, "Message for thread2");
  sprintf(s+400, "Message for thread3");
  pthread_create(&thread1, NULL, print_message, (void *)s);
  pthread_create(&thread2, NULL, print_message, (void *)(s+200));
  pthread_create(&thread3, NULL, print_message, (void *)(s+400));
  void *result;
  pthread_join(thread1, &result);
  pthread_join(thread2, &result);
  pthread_join(thread3, &result);
}

pthread_mutex_t mutex=PTHREAD_MUTEX_INITIALIZER;

void *print_message_mutex(void *arg){
  char *s = (char *)arg;
  char ss[400];
  int l = strlen(s);
  for(int i=0; i < l; i++){
    ss[2*i] = s[i];
    ss[2*i+1] = (s[i]==' ')?' ':'_';
  }
  ss[2*l] ='\0';
  pthread_mutex_lock(&mutex);
  printf("%s",s);
  printf("\n");
  printf("%s", ss);
  printf("\n");
  printf("ss = %p \n\n", (void *)ss);
  pthread_mutex_unlock(&mutex);
  return NULL;
}

void drive_pthreads_mutex(){
  pthread_t thread1, thread2, thread3;
  char s[600];
  sprintf(s, "Message for thread1");
  sprintf(s+200, "Message for thread2");
  sprintf(s+400, "Message for thread3");
  pthread_create(&thread1, NULL, print_message_mutex,
		 (void *)s);
  pthread_create(&thread2, NULL, print_message_mutex, 
		 (void *)(s+200));
  pthread_create(&thread3, NULL, print_message_mutex,
		 (void *)(s+400));
  void *result;
  pthread_join(thread1, &result);
  pthread_join(thread2, &result);
  pthread_join(thread3, &result);
}

pthread_spinlock_t spinlock;

void *print_message_spinlock(void *arg){
  char *s = (char *)arg;
  char ss[400];
  int l = strlen(s);
  for(int i=0; i < l; i++){
    ss[2*i] = s[i];
    ss[2*i+1] = (s[i]==' ')?' ':'_';
  }
  ss[2*l] ='\0';
  pthread_spin_lock(&spinlock);
  printf("%s",s);
  printf("\n");
  printf("%s", ss);
  printf("\n");
  printf("ss = %p \n\n", (void *)ss);
  pthread_spin_unlock(&spinlock);
  return NULL;
}

void drive_pthreads_spinlock(){
  pthread_spin_init(&spinlock, PTHREAD_PROCESS_PRIVATE);
  pthread_t thread1, thread2, thread3;
  char s[600];
  sprintf(s, "Message for thread1");
  sprintf(s+200, "Message for thread2");
  sprintf(s+400, "Message for thread3");
  pthread_create(&thread1, NULL, print_message_spinlock,
		 (void *)s);
  pthread_create(&thread2, NULL, print_message_spinlock, 
		 (void *)(s+200));
  pthread_create(&thread3, NULL, print_message_spinlock,
		 (void *)(s+400));
  void *result;
  pthread_join(thread1, &result);
  pthread_join(thread2, &result);
  pthread_join(thread3, &result);
}

int main(){
  drive_pthreads();
  cout<<endl<<endl;
  drive_pthreads_mutex();
  cout<<endl<<endl;
  drive_pthreads_spinlock();
}
