CPP = mpicxx
DFLAGS = -g -DDEBUG -openmp  
OFLAGS = -O3 -prec-div -no-ftz -DNDEBUG -openmp 
CFLAGS = $(OFLAGS)

######
.SUFFIXES: .cpp .c .o .exe
.PHONY: clean cleanx all

%.o: %.cpp
	$(CPP) $(CFLAGS) -c $<
%.s: %.cpp
	$(CPP) $(CFLAGS) -S $< 
%.exe: %.o
	$(CPP)  -openmp  -o $@ $^ 


######
all: procname

procname: procname.exe
	echo 'procname done'
procname.o: procname.cpp
procname.exe: procname.o

######
clean:
	rm *.exe; rm *.o;
