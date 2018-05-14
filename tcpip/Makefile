include ../makevars.mk
CFLAGS := -O3 -Drestrict=__restrict__  -Wshadow -MMD -MP
CFLAGSXX := #-Wno-unused-result
######
.SUFFIXES: 
.SUFFIXES: .cpp .o .exe .c .d
%.exe:%.o
	g++ -o $@ $^
%.o:%.cpp
	g++ $(CFLAGS) $(CFLAGSXX) -c $<

######
ipaddr.o: ipaddr.cpp
-include ipaddr.d
tcp_utils.o: tcp_utils.cpp
-include tcp_utils.d
server.o: server.cpp
-include server.d
client.o: client.cpp
-include client.d

######
ipaddr.exe: ipaddr.o
server.exe: server.o tcp_utils.o
client.exe: client.o tcp_utils.o
