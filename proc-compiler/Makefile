#########
CC = icc
CPP = icpc
OFLAGS = -O3  -DNDEBUG -prec-div -no-ftz -restrict #-fno-inline-functions 
CFLAGS = $(OFLAGS)


##########
.SUFFIXES: .cpp .c .o .exe

%.o: %.cpp
	$(CPP) $(CFLAGS) -c $<
%.o: %.c
	$(CC)  $(CFLAGS) -c $<
%.s: %.cpp
	$(CPP) $(CFLAGS) -S $< 
%.exe: %.o
	$(CPP)  -o $@ $^ 


##########






leibniz: leibniz.exe leibniz.s
	echo 'leibniz done'
leibniz.exe: leibniz.o
leibniz.o: leibniz.cpp
leibniz.s: leibniz.cpp

fusion: fusion.exe fusion.s
	echo 'fusion done'
fusion.exe: fusion.o
fusion.o: fusion.cpp
fusion.s: fusion.cpp

unrolljam: unrolljam.exe unrolljam.s
	echo 'unrolljam done'
unrolljam.exe: unrolljam.o
unrolljam.o: unrolljam.cpp
unrolljam.s: unrolljam.cpp


easymult: easymult.exe easymult.s easycppmult.s
	echo 'easymult done'
easymult.exe: easymult.o easycppmult.o easydriver.o
	$(CPP)  -o $@ $^ -L$$MKLROOT/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread #from link advisor
easydriver.o: easydriver.cpp
	$(CC)  $(CFLAGS) -I$$MKL_INC -c $<
easymult.o: easymult.cpp
easycppmult.o: easycppmult.cpp
	$(CPP) $(CFLAGS) -I$$MKL_INC -c $<
easymult.s: easymult.cpp
easycppmult.s: easycppmult.cpp
	$(CPP) $(CFLAGS) -I$$MKL_INC -S $<

clean:
	rm *.exe; rm *.o; 


