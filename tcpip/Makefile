CFLAGS := -O3 -Wno-unused-result -Wshadow -MMD -MP
#############
.SUFFIXES: 
.SUFFIXES: .cpp .o .exe .c .d
%.exe: %.o
	g++ -o $@ $^
.o: .cpp
	g++ $(CFLAGS) -c $<

##############
ipaddr.o: ipaddr.cpp
-include ipaddr.d

ipaddr.exe: ipaddr.o


server: server.exe
	echo 'server done'
server.o: sockets.cpp	
	g++ -c -O3 -DSERVER -o $@ $<
server.exe: server.o
	g++ -o $@ $^

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
