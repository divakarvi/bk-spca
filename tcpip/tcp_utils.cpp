#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "tcp_utils.hh"
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <cstring>

const char* PORTNUM = "28537";
struct cgw_info_struct gl_cgwin;
int gl_init_cgwin = 0;

void init_cgwin(int N, double cpughz){
	assrt(N > 0);
	gl_init_cgwin = 1;
	gl_cgwin.clk.tic();
	gl_cgwin.t = new double[N];
	gl_cgwin.cgw = new int[N];
	gl_cgwin.indx = 0;
	gl_cgwin.max_indx = N;
	gl_cgwin.CPUGHZ = cpughz;
}

void exit_cgwin(){
	gl_init_cgwin = 0;
	delete[] gl_cgwin.t;
	delete[] gl_cgwin.cgw;
}

int block_send(int sockfd, void *buf, int len){
	int total_sent = 0;
	int num_sends=0;
	while(total_sent < len){
		int ns = send(sockfd, buf, len-total_sent, 0);
		assrt(ns >= 0);
		buf = (char *)buf+ns;
		total_sent += ns;
		num_sends += 1;
	}
	return num_sends;
}

int block_send_cgw(int sockfd, void *buf, int len,
		   struct cgw_info_struct &cgwin){
	/*
	 * sending is broken down into sub-blocks to accumulate
	 * better time series for congestion window
	 */
	const int sub_blk = 1500;
	struct tcp_info info;
	int tisize = sizeof(struct tcp_info);
	int total_sent = 0;
	int num_sends = 0;
	while(total_sent < len){
		int remaining = len-total_sent;
		int ns = (sub_blk < remaining)? sub_blk:remaining;
		ns = send(sockfd, buf, ns, 0);
		assrt(ns >= 0);
		buf = (char *)buf+ns;
		total_sent += ns;
		num_sends += 1;
		getsockopt(sockfd, SOL_TCP, TCP_INFO, 
			   &info, (socklen_t *)&tisize);
		/*
		 * tcp_info --> congestion window
		 */
		cgwin.cgw[cgwin.indx] = info.tcpi_snd_cwnd;
		cgwin.t[cgwin.indx] = cgwin.clk.toc()/cgwin.CPUGHZ*1e-6;
		cgwin.indx++;
		/*
		 * restart time series when full
		 */
		if(cgwin.indx >= cgwin.max_indx)
			cgwin.indx = 0;
	}
	return num_sends;
}

int block_recv(int sockfd, void *buf, int len){
	int total_recv = 0;
	int num_recv = 0;
	while(total_recv < len){
		int nr = recv(sockfd, buf, len-total_recv, 0);
		assrt(nr >= 0);
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
	int rval = getaddrinfo(server, portnum, &hint, &llist);
	assrt(rval == 0);

	int sock2server = socket(llist->ai_family, 
				 llist->ai_socktype,
				 llist->ai_protocol);
	assrt(sock2server !=-1);
	rval = connect(sock2server, llist->ai_addr, llist->ai_addrlen);
	assrt(rval == 0);
	freeaddrinfo(llist);

	return sock2server;
}

int bind2port(const char* portnum){
	struct addrinfo hint;
	memset(&hint, 0, sizeof(hint));
	hint.ai_family = AF_UNSPEC;
	hint.ai_socktype = SOCK_STREAM;
	hint.ai_flags = AI_PASSIVE;
	struct addrinfo *llist;
	int rval = getaddrinfo(NULL, portnum, &hint, &llist);
	assrt(rval == 0);

	int sock2port = socket(llist->ai_family,
			       llist->ai_socktype,
			       llist->ai_protocol);
	assrt(sock2port != -1);
	rval = bind(sock2port, llist->ai_addr, llist->ai_addrlen);
	assrt(rval == 0);
	int backlog = 10;
	rval = listen(sock2port, backlog);
	assrt(rval == 0);

	int yes = 1;
	setsockopt(sock2port, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int));
	/*
	 * causes seg fault occasionally
	 * may be socket needs to be closed first
	 */
	/*freeaddrinfo(llist);*/
	
	return sock2port;
}

int connect2client(int sock2port){
	int sock2client;
	sock2client = accept(sock2port, NULL, NULL);
	assrt(sock2client !=-1);
	return sock2client;
}
