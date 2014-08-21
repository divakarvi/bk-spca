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

#include "../../utils/utils.hh"
#include "../init/mpi_init.hh"
#include "exchange.hh"

enum exchange_type {BLCK, NONBLCK, PSTNT};

/*
 * exchange 8 doubles 11 times and print result
 */
void test(int rank, int nprocs, enum exchange_type flag){
	const int bufsize = 8;
	double sendbuf[bufsize];
	double recvbuf[bufsize];
	for(int i=0; i < bufsize; i++){
		sendbuf[i] = (rank+1)*100;
		recvbuf[i] = -1;
	}
	
	char mesg[200];
	const char *xtype[3] = {"blocking", "non blocking", "persistent"};
	sprintf(mesg, "%s exchg: sendbuf on rank %d", xtype[flag], rank);
	array_show(sendbuf, bufsize, mesg);


	switch(flag){
	case BLCK:
		for(int i=0; i < 11; i++){
			exchange_blocking(rank, nprocs, 
					  sendbuf, recvbuf, bufsize);
			for(int j=0; j < bufsize; j++)
				sendbuf[j] = recvbuf[j];		
		}
		break;
	case NONBLCK:
		for(int i=0; i < 11; i++){
			exchange_nonblocking(rank, nprocs, 
					     sendbuf, recvbuf, bufsize);
			for(int j=0; j < bufsize; j++)
				sendbuf[j] = recvbuf[j];		
		}
		break;
	case PSTNT:
		Exchg exchg(rank, nprocs, bufsize);
		double *sbuf = exchg.getsbuf();
		double *rbuf = exchg.getrbuf();
		for(int i=0; i < bufsize; i++)
			sbuf[i] = sendbuf[i];
		for(int i=0; i < 11; i++){
			exchg.post();
			exchg.wait();
			for(int j=0; j < bufsize; j++)
				sbuf[j] = rbuf[j];
		}
		for(int i=0; i < bufsize; i++)
			sendbuf[i] = sbuf[i];
		break;
	}
	
	std::cout<<std::endl;
	array_show(sendbuf, bufsize, mesg);
}

int main(){
	int rank, nprocs;
	mpi_initialize(rank, nprocs);
	assrt(nprocs == 2);

	verify_dir("DBG");
	char fname[200];
	sprintf(fname, "DBG/test_xchg_P%d.txt", rank);
	link_cout(fname);

	test(rank, nprocs, BLCK);
	test(rank, nprocs, NONBLCK);
	test(rank, nprocs, PSTNT);

	unlink_cout();

	mpi_finalize();
}
