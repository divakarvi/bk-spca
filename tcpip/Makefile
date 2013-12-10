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
