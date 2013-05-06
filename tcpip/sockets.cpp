#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <cassert>
#include "TimeStamp.hh"
#include "StatVector.hh"


using namespace std;
#define CPUGHZ 3.4  //1.8 or 3.3 or 3.4

#ifdef CLIENT
#undef FIT_MTU_CLIENT
#endif
const char* PORTNUM="28537"; 


void cmd2str(const char*cmd, char *s){
	FILE* pipe = popen(cmd, "r");
	fscanf(pipe, "%s", s);
	pclose(pipe);
}

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
	print_ipaddr("lonestar.tacc.utexas.edu");
	print_ipaddr("www.sagemath.org");
	print_ipaddr("www.ft.com");
	print_ipaddr("www.nytimes.com");
	print_ipaddr("www.economist.com");
	print_ipaddr("www.kernel.org");
	print_ipaddr("xubuntu.org");
	print_ipaddr("krugman.blogs.nytimes.com");
	print_ipaddr("news.bbc.co.uk");
	print_ipaddr("www.guardian.co.uk");
	print_ipaddr("www.thehindu.com");
	print_ipaddr("www.google.com");
	print_ipaddr("www.bing.com");
	print_ipaddr("www.amazon.com");
	print_ipaddr("www.abebooks.com");
	print_ipaddr("www.walmart.com");
}



#ifndef FIT_MTU_CLIENT
int block_send(int sockfd, void *buf, int len){
	int total_sent = 0;
	int num_sends=0;
	while(total_sent < len){
		int ns = send(sockfd, buf, len-total_sent, 0);
		buf = (char *)buf+ns;
		total_sent += ns;
		num_sends += 1;
	}
	return num_sends;
}
#else
TimeStamp clk_cgwin;
double *t_cgwin;//in milliseconds
int *cgwin;
int i_cgwin=0;
int max_cgwin;

int block_send(int sockfd, void *buf, int len){
	const int sub_blk=1500;
	struct tcp_info info;
	int tisize = sizeof(struct tcp_info);
	int total_sent = 0;
	int num_sends=0;
	while(total_sent < len){
		int remaining = len-total_sent;
		int ns = (sub_blk < remaining)? sub_blk:remaining;
		ns = send(sockfd, buf, ns, 0);
		buf = (char *)buf+ns;
		total_sent += ns;
		num_sends += 1;
		getsockopt(sockfd, SOL_TCP, TCP_INFO, 
			   &info, (socklen_t *)&tisize);
		cgwin[i_cgwin] = info.tcpi_snd_cwnd;
		t_cgwin[i_cgwin] = clk_cgwin.toc()/CPUGHZ*1e-6;
		i_cgwin++;
		if(i_cgwin >= max_cgwin)
			i_cgwin = 0;
	}
	return num_sends;
}
#endif

int block_recv(int sockfd, void *buf, int len){
	int total_recv = 0;
	int num_recv = 0;
	while(total_recv < len){
		int nr = recv(sockfd, buf, len-total_recv, 0);
		if(nr==0){
			num_recv=0;
			break;
		}
		buf = (char *)buf+nr;
		total_recv += nr;
		num_recv += 1;
	}
	return num_recv;
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

void partialsum_client(int sock2server, 
		       double *series, int n,
		       int blocksize,
		       double *psum,
		       StatVector& stat_ns,
		       StatVector& stat_nr,
		       StatVector& stat_ts,
		       StatVector& stat_tr){
	assert(n%blocksize==0);
	int count = n/blocksize;
	double cycles;
	TimeStamp clk;
	for(int i=0; i < count; i++){
		clk.tic();
		int nsend=block_send(sock2server, series, 8*blocksize);
		cycles = clk.toc();
		stat_ns.insert((double)nsend);
		stat_ts.insert((double)cycles);
		clk.tic();
		int nrecv=block_recv(sock2server, psum, 8*blocksize);
		cycles = clk.toc();
		stat_nr.insert((double)nrecv);
		stat_tr.insert((double)cycles);
		series += blocksize;
		psum += blocksize;
	}
	close(sock2server);
}


void client(const char* server, int blocksize){
	int n;
#ifndef FIT_MTU_CLIENT
	if(blocksize < 1000)
		n = 1000*blocksize*10;
	else
		n=1000*1000*20;
#else
	if(blocksize < 1000)
		n = 1000*blocksize;
	else
		n=1000*1250;
#endif
	n = (n/blocksize)*blocksize;
	int sock2server = connect2server(server, PORTNUM);
	double *series= new double[n];
	for(int i=0; i < n; i++)
		series[i] = (i%2==0)?4.0/(2*i+1):-4.0/(2*i+1);
	double *psum=new double[n];
	int count = n/blocksize;
	StatVector stat_ns(count), stat_nr(count),
		stat_ts(count), stat_tr(count);
	TimeStamp clk;
	clk.tic();
	partialsum_client(sock2server, series, n, blocksize, psum,
			  stat_ns, stat_nr, stat_ts, stat_tr);
	double cycles = clk.toc();

	char fname[200];
	char cmd[200];
	char str[200];
	cmd2str("date '+%m_%d_%y_h%H'", str);
	sprintf(fname,"OUTPUT/tcpip_%s.txt", str);
	sprintf(cmd, "uname -n >> %s", fname);
	system(cmd);
	ofstream ofile(fname, ios_base::app);
#ifdef FIT_MTU_CLIENT
	ofile<<"Send on client broken up to fit MTU"<<endl;
#endif
	ofile<<"n = "<<n*1.0<<endl;
	ofile<<"blksize = "<<blocksize*1.0<<endl;
	ofile<<"pi = "<<psum[n-1]<<endl;
	ofile<<"error = "<<3.141592653589793238462643383-psum[n-1]<<endl;
	ofile<<"nsend = "<<stat_ns.median()<<endl;
	ofile<<"nrecv = "<<stat_nr.median()<<endl;
	ofile<<"send  = "<<stat_ts.median()/(1e9*CPUGHZ)*1e3<<" ms"<<endl;
	ofile<<"recv  = "<<stat_tr.median()/(1e9*CPUGHZ)*1e3<<" ms"<<endl;
	ofile<<"bandwidth = "<<16.0*n/cycles*1e9*CPUGHZ/1e3<<" kbps"<<endl;
	cout<<"bandwidth = "<<16.0*n/cycles*1e9*CPUGHZ/1e3<<" kbps"<<endl;
	for(int i=0; i < 70; i++)
		ofile<<"-";
	ofile<<endl;
	delete[] series;
	delete[] psum;
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
	/*causes seg fault occasionally*/
	/*may be socket needs to be closed first*/
	//freeaddrinfo(llist);	
	return sock2port;
}

int connect2client(int sock2port){
	int sock2client;
	sock2client = accept(sock2port, NULL, NULL);
	return sock2client;
}

void partialsum_server(int sock2client, int blocksize){
	double *recvbuf = new double[blocksize];
	double *sendbuf = new double[blocksize];
	double S=0;
	while(1){
		int nrecv=block_recv(sock2client, recvbuf, 8*blocksize);
		if(nrecv==0)
			break;
		for(int i=0; i < blocksize; i++){
			S += recvbuf[i];
			sendbuf[i] = S;
		}
		block_send(sock2client, sendbuf, 8*blocksize);
	}
	close(sock2client);
	delete[] recvbuf;
	delete[] sendbuf;
}

void server(int blocksize){
	int sock2port= bind2port(PORTNUM);
	while(1){
		int sock2client = connect2client(sock2port);
		partialsum_server(sock2client, blocksize); 
	}
}

void display_cgwin(double *t, int *cgwin, int len){
	FILE *fptr;
	fptr = fopen("OUTPUT/cgwin.dat", "w");
	for(int i=0; i < len; i++)
		fprintf(fptr, "\t%8.3e \t\t %d \n", t[i], cgwin[i]);
	fclose(fptr);
}

int main(int argc, char **argv){
	int BLKSZ;

#ifdef FIT_MTU_CLIENT
	clk_cgwin.tic();
	i_cgwin = 0;
	max_cgwin = 1000*1000;
	t_cgwin = new double[max_cgwin];
	cgwin = new int[max_cgwin];
#endif

#ifdef SERVER
       BLKSZ = atoi(argv[1]);
       cout<<"BLKSZ = "<<BLKSZ<<endl;
       server(BLKSZ);
#elif CLIENT
       BLKSZ = atoi(argv[2]);
       client(argv[1],BLKSZ);
#else
       run_ipaddr();
#endif

#ifdef FIT_MTU_CLIENT
       display_cgwin(t_cgwin, cgwin, i_cgwin);
       delete[] t_cgwin;
       delete[] cgwin;
#endif
}
