#include "../utils/utils.hh"
#include "tcp_utils.hh"
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
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
	int sock2port= bind2port(PORTNUM);
	while(1){
		int sock2client = connect2client(sock2port);
		partialsum_server(sock2client, blocksize); 
	}
}

int main(){
	std::cout<<"      blksz = "
		"number of doubles sent/rcvd in single exchange"<<std::endl;
	std::cout<<"input blksz : ";
	int blocksize;
	std::cin>>blocksize;
	
	server(blocksize);
}

