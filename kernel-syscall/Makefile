syscall.exe: syscall.c
	gcc -O3 -o syscall.exe syscall.c

time_syscall.exe: time_syscall.o dummy_sys.o
	g++ -o time_syscall.exe time_syscall.o dummy_sys.o
time_syscall.o: time_syscall.cpp
	g++ -O3 -c time_syscall.cpp
dummy_sys.o: dummy_sys.cpp
	g++ -O3 -c dummy_sys.cpp

dvmesg.exe: dvmesg.c
	gcc -o $@ $<