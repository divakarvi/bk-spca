#ifndef __TCPUTILS11DEC2013__
#define __TCPUTILS11DEC2013__
/*
 *        sockfd = socket file descriptor
 * buf[0..len-1] = bytes to be sent
 */
int block_send(int sockfd, void *buf, int len);

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
