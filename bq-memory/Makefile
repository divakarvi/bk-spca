#########
CC = icc
CPP = icpc
DFLAGS = -g -DDEBUG -I$$MKL_INC -restrict
OFLAGS = -O3 -prec-div -no-ftz -fno-inline-functions -DNDEBUG  -restrict -I$$MKL_INC 
CFLAGS = $(OFLAGS)
MKLLIBS = -L$$MKLROOT/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread #from link advisor

##########
.SUFFIXES: .cpp .c .o .exe

%.o:%.cpp
	$(CPP) $(CFLAGS) -c $<
%.o:%.c
	$(CC)  $(CFLAGS) -c $<
%.o:%.s
	$(CC)  $(CFLAGS) -c $<
%.s:%.cpp
	$(CPP) $(CFLAGS) -S $< 
%.exe:%.o
	$(CPP)  -o $@ $^ $(MKLLIBS)


##########
latency2dram: latency2dram.exe latency2dram.s latency2dram-x.s
	echo 'latency2dram done'
latency2dram.exe: latency2dram.o latency2dram-x.o dummy.o
latency2dram.o: latency2dram.cpp
latency2dram.s: latency2dram.cpp
latency2dram-x.o: latency2dram-x.cpp
latency2dram-x.s: latency2dram-x.cpp

##########
latency4n: latency4n.exe latency4n.s dummy.s
	echo 'latency4n done'
latency4n.exe: latency4n.o dummy.o
latency4n.o: latency4n.cpp
latency4n.s: latency4n.cpp

dummy.o: dummy.cpp
dummy.s: dummy.cpp	

##########
sumcopy: sumcopy.exe sumcopy.s
	echo 'sumcopy done'
sumcopy.exe: drv-sumcopy.o sumcopy.o
drv-sumcopy.o: drv-sumcopy.cpp sumcopy.hh
sumcopy.o: sumcopy.cpp sumcopy.hh
sumcopy.s: sumcopy.cpp sumcopy.hh


##########
transpose: transpose.exe transpose.s
	echo 'transpose done'
transpose.exe: drv-transpose.o transpose.o
drv-transpose.o: drv-transpose.cpp transpose.hh
transpose.o: transpose.cpp transpose.hh
transpose.s: transpose.cpp transpose.hh


##########
peakflops: peakflops.exe peakflops.s
	echo 'peakflops done'
peakflops.exe: peakflops.o
peakflops.o: peakflops.cpp
peakflops.s: peakflops.cpp

##########
multxmm: multxmm.exe multxmm.s 
	echo 'multxmm done'
multxmm.exe: multxmm.o drv-multxmm.o 
drv-multxmm.o: drv-multxmm.cpp
multxmm.o: multxmm.cpp
multxmm.s: multxmm.cpp

##########
multasm: multasm.exe 
	echo 'multasm done'
multasm.exe:  drv-asm.o asm4x1x4.o asm4x4x4.o asm4x20x4.o asm4x40x4.o asm4x100x4.o asm4x200x4.o multasm.o
	$(CPP)  -o $@ $^ 
drv-asm.o: drv-asm.cpp multasm.hh
multasm.o: multasm.cpp

###########
vmemmap: vmemmap.exe
	echo "vmemmap done"
vmemmap.exe: vmemmap.o
	icpc -o $@ $^
vmemmap.o: vmemmap.c
	icpc -c -O3 -fno-inline-functions $^

###########
clean:
	rm *.exe; rm *.o; rm transpose.s; rm latency2dram.s; rm peakflops.s; rm sumcopy.s; rm bmult.s; rm latency2dram-x.s #rm multxmm.s;

cleanx: 
	rm pbs*

