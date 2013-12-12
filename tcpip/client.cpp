#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"
#include "../utils/StatVector.hh"
#include "tcp_utils.hh"
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <iostream>
#include <fstream>

enum client_flag_enum {CGWIN_ON, CGWIN_OFF};
enum client_flag_enum gl_client_flag = CGWIN_OFF;

void cmd2str(const char*cmd, char *s){
	FILE* pipe = popen(cmd, "r");
	fscanf(pipe, "%s", s);
	pclose(pipe);
}

/*
 * transmit series[0..n-1]
 * recv     psum[0..n-1] (partial sums of above)
 * transmission in blocks of size blocksize
 * assumes n divisible by blocksize
 * stat_ns --> number of sends per block
 * star_nr --> number of recvs per block
 * stat_ts --> cycles per block sent
 * stat_tr --> cycles per block rcvd
 */
void partialsum_client(int sock2server, 
		       double *series, int n,
		       int blocksize,
		       double *psum,
		       StatVector& stat_ns,
		       StatVector& stat_nr,
		       StatVector& stat_ts,
		       StatVector& stat_tr){
	assrt(gl_init_cgwin == 1);
	
	int count = n/blocksize;
	assrt(n%blocksize == 0);
	double cycles;
	TimeStamp clk;

	for(int i=0; i < count; i++){
		clk.tic();
		int nsend;
		switch(gl_client_flag){
		case CGWIN_OFF:
			nsend=block_send(sock2server, series, 8*blocksize);
			break;
		case CGWIN_ON:
			nsend=block_send_cgw(sock2server, series, 8*blocksize,
					     gl_cgwin);
			break;
		}
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

void client(const char *server, int blocksize, int n){
	assrt(n%blocksize == 0);
	
	double *series= new double[n];
	for(int i=0; i < n; i++)
		series[i] = (i%2==0)?4.0/(2*i+1):-4.0/(2*i+1);
	double *psum=new double[n];
	int count = n/blocksize;
	StatVector stat_ns(count), stat_nr(count),
		stat_ts(count), stat_tr(count);

	std::cout<<"client: connecting to server "<<server<<std::endl;
	int sock2server = connect2server(server, PORTNUM);

	TimeStamp clk;
	clk.tic();
	partialsum_client(sock2server, series, n, blocksize, psum,
			  stat_ns, stat_nr, stat_ts, stat_tr);
	double cycles = clk.toc();
	std::cout<<"client: done sending series & recving partial sums"
		 <<std::endl;

	/*
	 * output information about partial sum service
	 */
	double CPUGHZ = gl_cgwin.CPUGHZ;
	char fname[200];
	char cmd[200];
	char str[200];
	cmd2str("date '+%m_%d_%y_h%H'", str);
	sprintf(fname,"OUTPUT/tcpip_%s.txt", str);
	sprintf(cmd, "uname -n >> %s", fname);
	system(cmd);
	std::cout<<"client: output sent to "<<fname<<std::endl;
	std::ofstream ofile(fname, std::ios::app);
	if(gl_client_flag == CGWIN_ON)
		ofile<<"blocks broken up to collect cgwin time series"
		     <<std::endl;
	ofile<<"series size(n) = "<<n*1.0<<std::endl;
	ofile<<"       blksize = "<<blocksize*1.0<<std::endl;
	ofile<<"            pi = "<<psum[n-1]<<std::endl;
	ofile<<"         error = "<<3.141592653589793238462643383-psum[n-1]
	     <<std::endl;
	ofile<<"   nsend/block = "<<stat_ns.median()<<std::endl;
	ofile<<"   nrecv/block = "<<stat_nr.median()<<std::endl;
	ofile<<" send ms/block = "<<stat_ts.median()/(1e9*CPUGHZ)*1e3
	     <<" ms"<<std::endl;
	ofile<<" recv ms/block = "<<stat_tr.median()/(1e9*CPUGHZ)*1e3
	     <<" ms"<<std::endl;
	ofile<<"     bandwidth = "<<16.0*n/cycles*1e9*CPUGHZ/1e3<<" kbps"
	     <<std::endl;
	for(int i=0; i < 70; i++)
		ofile<<"-";
	ofile<<std::endl;
	ofile.close();

	std::cout<<"client: bandwidth = "<<16.0*n/cycles*1e9*CPUGHZ/1e3<<" kbps"
		 <<std::endl;
	

	delete[] series;
	delete[] psum;
}

int main(int argc, char **argv){
	std::cout<<"client: CPUGHZ of HP a6400z = 1.8 "<<std::endl;
	std::cout<<"client: CPUGHZ of HP Z200   = 3.4 "<<std::endl;
	std::cout<<"client: CPUGHZ of screms    = 2.6 "<<std::endl;
	std::cout<<"client: CPUGHZ of lonestar  = 3.3 "<<std::endl;
	std::cout<<"client: CPUGHZ of stampede  = 2.7 "<<std::endl;
	std::cout<<"client: input client CPUGHZ = ";
	double cpughz;
	std::cin>>cpughz;
	std::cout<<std::endl;
	
	int tmp;
	std::cout<<"client: input 1 to keep track of cgwin"<<std::endl;
	std::cout<<"client: keep track of cgwin? ";
	std::cin>>tmp;
	std::cout<<std::endl;
	if(tmp == 1){
		gl_client_flag = CGWIN_ON;
		std::cout<<"client: setting cgwin time series"
			"to max of 10^6 entries"<<std::endl;
		init_cgwin(1000*1000, cpughz);
	}
	else{
		gl_client_flag = CGWIN_OFF;
		init_cgwin(1, cpughz);
	}

	int blocksize;
	std::cout<<"client: blocksize must be same as on server"<<std::endl;
	std::cout<<"client: blocksize = ";
	std::cin>>blocksize;
	std::cout<<std::endl;
	assrt(blocksize > 0);

	int n;
	std::cout<<"client number of blocks = ";
	std::cin>>n;
	std::cout<<std::endl;
	assrt(n > 0);
	n = n*blocksize; /* number of terms in series */

	client(argv[1], blocksize, n); 
	
	exit_cgwin();
}
