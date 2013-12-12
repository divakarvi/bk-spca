#ifndef __TCPUTILS11DEC2013__
#define __TCPUTILS11DEC2013__
#include "../utils/utils.hh"
#include "../utils/TimeStamp.hh"

extern const char* PORTNUM;

/*
 * cgw[] as a function of t[] is stored in this struct
 * block_send_cgwin is chiefly responsible for accumulating that function
 */
struct cgw_info_struct{
	TimeStamp clk;
	double *t;
	int *cgw;
	int indx;
	int max_indx;
	double CPUGHZ; /* used to convert cycles to ms */
};

extern struct cgw_info_struct gl_cgwin;
extern int gl_init_cgwin;
void init_cgwin(int N, double cpughz);
void exit_cgwin();

/*
 *        sockfd = socket file descriptor
 * buf[0..len-1] = bytes to be sent
 */
int block_send(int sockfd, void *buf, int len);

int block_send_cgw(int sockfd, void *buf, int len,
		   struct cgw_info_struct &cgwin);

/*
 *        sockfd = socket file descriptor
 * buf[0..len-1] = bytes to be recvd
 */
int block_recv(int sockfd, void *buf, int len);

/*
 * connect to server on a given port
 * returns socket file descriptor
 */
int connect2server(const char *server, const char *portnum);

/*
 * bind server to port
 * returns socket file descriptor
 */
int bind2port(const char* portnum);

/*
 * accept connection from client
 * sock2port = socket binding server to client
 * returns socket file descriptor
 */
int connect2client(int sock2port);
#endif
