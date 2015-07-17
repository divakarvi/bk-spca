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

#include "../utils/utils.hh"
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <iostream>
#include <cstring>

struct addrinfo *saddrlist(const char *inaddr){
	struct addrinfo hint;
	memset(&hint, 0, sizeof(hint));
	hint.ai_family = AF_UNSPEC;
	hint.ai_socktype = SOCK_STREAM;
	struct addrinfo *llist;
	int rval = getaddrinfo(inaddr, NULL, &hint, &llist);
	assrt(rval == 0);
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
	std::cout<<ipver<<" address : "<<ipstr<<std::endl;
}

void printlist(struct addrinfo *llist){
	while(llist != NULL){
		printinfo(llist);
		llist = llist->ai_next;
	}
}

void print_ipaddr(const char* addr){
	std::cout<<"           IP addresses of "<<addr<<std::endl;
	struct addrinfo *llist;
	llist = saddrlist(addr);
	printlist(llist);
	std::cout<<std::endl;
	freeaddrinfo(llist);
}

int main(){
	char myname[200];
	gethostname(myname, 200);
	print_ipaddr(myname);
	print_ipaddr("stampede.tacc.utexas.edu");
	print_ipaddr("lonestar.tacc.utexas.edu");
	print_ipaddr("www.python.org");
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
