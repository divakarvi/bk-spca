#include "../utils/utils.hh"
#include "tcp_utils.hh"
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <cstdlib>
#include <iostream>

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
	std::cout<<"server: binding to port "<<PORTNUM<<std::endl;
	int sock2port= bind2port(PORTNUM);
	while(1){
		std::cout<<"server: accepting clients"<<std::endl;
		int sock2client = connect2client(sock2port);
		std::cout<<"server: connected to client"<<std::endl;
		partialsum_server(sock2client, blocksize); 
		std::cout<<"server: client connection terminated"<<std::endl;
	}
}

int main(){
	system("uname -a");
	std::cout<<"server: blksz = "
		"number of doubles sent/rcvd in single exchange"<<std::endl;
	std::cout<<"server: input blksz : ";
	int blocksize;
	std::cin>>blocksize;
	std::cout<<std::endl;
	
	server(blocksize);
}

