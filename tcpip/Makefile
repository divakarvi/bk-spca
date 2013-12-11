CFLAGS := -O3 -Drestrict=__restrict__ -Wno-unused-result -Wshadow -MMD -MP
#############
.SUFFIXES: 
.SUFFIXES: .cpp .o .exe .c .d
%.exe:%.o
	g++ -o $@ $^
%.o:%.cpp
	g++ $(CFLAGS) -c $<

##############
ipaddr.o: ipaddr.cpp
-include ipaddr.d

ipaddr.exe: ipaddr.o

tcp_utils.o: tcp_utils.cpp
-include tcp_utils.d

server.o: server.cpp
-include server.d

server.exe: server.o tcp_utils.o

client: client.exe
	echo 'client done'
client.o: sockets.cpp	
	g++ -c -O3 -DCLIENT -Wno-unused-result -o $@ $<
client.exe: client.o
	g++ -o $@ $^

sockets: sockets.exe
	echo 'sockets done'
sockets.o: sockets.cpp	
	g++ -c -O3 -o $@ $<
sockets.exe: sockets.o
	g++ -o $@ $^

##########
clean:
	rm *.exe; rm *.o; rm core*;
