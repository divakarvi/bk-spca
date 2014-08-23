CPP = mpicxx
DFLAGS = -g -DDEBUG -openmp  
OFLAGS = -O3 -prec-div -no-ftz -DNDEBUG -openmp 
CFLAGS = $(OFLAGS)

##########
.SUFFIXES: .cpp .c .o .exe
.PHONY: clean cleanx all

%.o: %.cpp
	$(CPP) $(CFLAGS) -c $<
%.s: %.cpp
	$(CPP) $(CFLAGS) -S $< 
%.exe: %.o
	$(CPP)  -openmp -o $@ $^ 


##########
all: diskio-mpi

diskio-mpi: diskio-mpi.exe
	echo 'diskio-mpi done'
diskio-mpi.o: diskio-mpi.cpp
diskio-mpi.exe: diskio-mpi.o


##########
clean:
	rm *.exe; rm *.o;

