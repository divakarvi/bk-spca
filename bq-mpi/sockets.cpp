#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
using namespace std;
const char *PORTNUM="28537";
const int MAXLEN = 1000*1000*10;

struct addrinfo *saddrlist(const char *inaddr){
  struct addrinfo hint;
  memset(&hint, 0, sizeof(hint));
  hint.ai_family = AF_UNSPEC;
  hint.ai_socktype = SOCK_STREAM;
  struct addrinfo *llist;
  getaddrinfo(inaddr, NULL, &hint, &llist);
  return llist;
}

void printinfo(struct addrinfo *p){
  char ipver[200];
  void *addr;
  if(p->ai_family==AF_INET){
    struct sockaddr_in *ipv4 = (struct sockaddr_in *)p->ai_addr;
    addr = &(ipv4->sin_addr);
    strcpy(ipver, "IPv4");
  }
  else if(p->ai_family==AF_INET6){
    struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *)p->ai_addr;
    addr = &(ipv6->sin6_addr);
    strcpy(ipver, "IPv6");
  }
  else
    return;
  char ipstr[INET6_ADDRSTRLEN];
  inet_ntop(p->ai_family, addr, ipstr, INET6_ADDRSTRLEN);
  cout<<ipver<<" address : "<<ipstr<<endl;
}

void printlist(struct addrinfo *llist){
  while(llist != NULL){
    printinfo(llist);
    llist = llist->ai_next;
  }
}

void print_ipaddr(const char* addr){
  cout<<"           IP addresses of "<<addr<<endl;
  struct addrinfo *llist;
  llist = saddrlist(addr);
  printlist(llist);
  cout<<endl;
  freeaddrinfo(llist);
}

void run_ipaddr(){
  char myname[200];
  gethostname(myname, 200);
  print_ipaddr(myname);
  print_ipaddr("www.sagemath.org");
  print_ipaddr("www.ft.com");
  print_ipaddr("www.economist.com");
  print_ipaddr("www.kernel.org");
  print_ipaddr("xubuntu.org");
  print_ipaddr("www.archlinux.org");
  print_ipaddr("krugman.blogs.nytimes.com");
  print_ipaddr("www.nytimes.com");
  print_ipaddr("news.bbc.co.uk");
  print_ipaddr("www.guardian.co.uk");
  print_ipaddr("www.thehindu.com");
  print_ipaddr("www.google.com");
  print_ipaddr("www.bing.com");
  print_ipaddr("www.amazon.com");
  print_ipaddr("www.abebooks.com");
  print_ipaddr("www.walmart.com");
}

int connect2server(const char *server, const char *portnum){
  struct addrinfo hint;
  memset(&hint, 0, sizeof(hint));
  hint.ai_family = AF_UNSPEC;
  hint.ai_socktype = SOCK_STREAM;
  struct addrinfo *llist;
  getaddrinfo(server, portnum, &hint, &llist);
  int sock2server = socket(llist->ai_family, 
			   llist->ai_socktype,
			   llist->ai_protocol);
  connect(sock2server, llist->ai_addr, llist->ai_addrlen);
  freeaddrinfo(llist);
  return sock2server;
}

int partialsum_client(int sock2server, 
		      double *series, int n,
		      int packetsize,
		      double *psum){
  int status = 0;
  int count = n/packetsize;
  if(n%packetsize>0)
    count++;
  for(int i=0; i < count; i++){
    if(i==count-1)
      packetsize = n-(count-1)*packetsize;
    int ns=send(sock2server, series, 8*packetsize, 0);
    int nr=recv(sock2server, psum, 8*packetsize, 0);
    series += packetsize;
    psum += packetsize;
    if((ns != 8*packetsize)||(nr != ns)){
      status = -1;
      break;
    }
  }
  close(sock2server);
  return status;
}

void client(){
  const char* server = "login1.ls4.tacc.utexas.edu";
  int sock2server = connect2server(server, PORTNUM);
  const int n = 100;
  double series[n];
  for(int i=0; i < n; i++)
    series[i] = i;
  double psum[n];
  partialsum_client(sock2server, series, n, n, psum);
  for(int i=0; i < n; i++)
    cout<<psum[i]<<endl;
}

int bind2port(const char* portnum){
  struct addrinfo hint;
  hint.ai_family = AF_UNSPEC;
  hint.ai_socktype = SOCK_STREAM;
  hint.ai_flags = AI_PASSIVE;
  struct addrinfo *llist;
  getaddrinfo(NULL, portnum, &hint, &llist);
  int sock2port = socket(llist->ai_family,
			 llist->ai_socktype,
			 llist->ai_protocol);
  bind(sock2port, llist->ai_addr, llist->ai_addrlen);
  int backlog=10;
  listen(sock2port, backlog);
  int yes = 1;
  setsockopt(sock2port, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int));
  freeaddrinfo(llist);
  return sock2port;
}

int connect2client(int sock2port){
  int sock2client;
  sock2client = accept(sock2port, NULL, NULL);
  return sock2client;
}

void partialsum_server(int sock2client, 
		       double *sendbuf, double *recvbuf){
  
  double S=0;
  while(1){
    int nr = recv(sock2client, recvbuf, 8*MAXLEN, 0);
    if((nr%8>0)||(nr<=0))
      break;
    for(int i=0; i < nr/8; i++){
      S += recvbuf[i];
      sendbuf[i] = S;
    }
    int ns = send(sock2client, sendbuf, nr, 0);
    if(ns!=nr)
      break;
  }
  close(sock2client);
}

void server(){
  double *sendbuf = new double[MAXLEN];
  double *recvbuf = new double[MAXLEN];
  int sock2port= bind2port(PORTNUM);
  while(1){
    int sock2client = connect2client(sock2port);
    partialsum_server(sock2client, sendbuf, recvbuf); 
  }

  delete[] sendbuf;
  delete[] recvbuf;
}

int main(){
#ifdef SERVER
  server();
#elif CLIENT
  client();
#else
  run_ipaddr();
#endif
}
