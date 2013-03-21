#########
CC = icc
CPP = icpc
DFLAGS = -g -DDEBUG -I$$MKL_INC -restrict
OFLAGS = -O3 -prec-div -no-ftz -DNDEBUG  -fno-inline-functions -restrict -I$$MKL_INC
CFLAGS = $(OFLAGS)
MKLLIBS = -L$$MKLROOT/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread #from link advisor

##########
.SUFFIXES: .cpp .c .o .exe

.cpp.o:
	$(CPP) $(CFLAGS) -c $<
.c.o:
	$(CC)  $(CFLAGS) -c $<
.s.o:
	$(CC)  $(CFLAGS) -c $<
.cpp.s:
	$(CPP) $(CFLAGS) -S $< 
.o.exe:
	$(CPP)  -o $@ $^ $(MKLLIBS)


##########
latency2dram: latency2dram.exe latency2dram.s
	echo 'latency2dram done'
latency2dram.exe: latency2dram.o
latency2dram.o: latency2dram.cpp
latency2dram.s: latency2dram.cpp


##########
transpose: transpose.exe transpose.s
	echo 'transpose done'
transpose.exe: drv-transpose.o transpose.o
drv-transpose.o: drv-transpose.cpp transpose.hh
transpose.o: transpose.cpp transpose.hh
transpose.s: transpose.cpp transpose.hh

##########
sumcopy: sumcopy.exe sumcopy.s
	echo 'sumcopy done'
sumcopy.exe: drv-sumcopy.o sumcopy.o
drv-sumcopy.o: drv-sumcopy.cpp sumcopy.hh
sumcopy.o: sumcopy.cpp sumcopy.hh
sumcopy.s: sumcopy.cpp sumcopy.hh

##########
bmult: bmult.exe bmult.s
	echo 'bmult done'
bmult.exe: drv-bmult.o bmult.o
drv-bmult.o: drv-bmult.cpp bmult.hh
bmult.o: bmult.cpp bmult.hh
bmult.s: bmult.cpp bmult.hh


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

multasm: multasm.exe
	echo 'multasm done'
multasm.exe:  drv-asm.o asm4x1x4.o asm4x2x4.o asm4x4x4.o  asm4x30x4.o
	$(CPP)  -o $@ $^ 
drv-asm.o: drv-asm.cpp multasm.hh
asm4x1x4.o: asm4x1x4.s
asm4x2x4.o: asm4x2x4.s
asm4x4x4.o: asm4x4x4.s
asm4x30x4.o: asm4x30x4.s
clean:
	rm *.exe; rm *.o; rm transpose.s; rm latency2dram.s; rm peakflops.s; rm sumcopy.s; rm bmult.s; rm multxmm.s;


