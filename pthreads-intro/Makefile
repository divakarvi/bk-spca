include ../makevars.mk
%.o : %.cpp
	g++ -c -Drestrict=' ' -O3 $<

%.exe: %.o
	g++ -o $@ $^ -lpthread

print_mesg.exe: print_mesg.o mesg_plain.o mesg_mutex.o mesg_spin.o

leibniz.exe: leibniz.o