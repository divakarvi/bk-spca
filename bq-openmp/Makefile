#########
CPP = icpc
OFLAGS = -O3 -openmp -restrict -prec-div -no-ftz -DNDEBUG  -fno-inline-functions -I$$MKL_INC -I$$FFTW_INC
CFLAGS = $(OFLAGS)
MKLLIBS = -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread #from link advisor

##########
.SUFFIXES: .cpp .c .o .exe

.cpp.o:
	$(CPP) $(CFLAGS) -c $<
.cpp.s:
	$(CPP) $(CFLAGS) -S $< 
.o.exe:
	$(CPP)  -openmp -o $@ $^ 

##########
all: leibniz critical overhead latency peakdram

leibniz: leibniz.exe leibniz.s
	echo 'leibniz done'
leibniz.exe: leibniz.o drv-leibniz.o
leibniz.o: leibniz.cpp
leibniz.s: leibniz.cpp
drv-leibniz.o: drv-leibniz.cpp

overhead: overhead.exe parallelA.s
	echo 'overhead done'
overhead.exe: overhead.o parallelA.o parallelB.o dummy.o
overhead.o: overhead.cpp
parallelA.s: parallelA.cpp
parallelA.o: parallelA.cpp
parallelB.o: parallelB.cpp
dummy.o: dummy.cpp
	icpc -restrict -O3 -c $<
dummy.s: dummy.cpp

critical: critical.exe critical.s 
	echo 'critical done'
critical.exe: critical.o 
critical.o: critical.cpp
critical.s: critical.cpp

peakdram: peakdram.exe peakdram.s
	echo 'peakdram done'
peakdram.exe: peakdram.o dummy.o
	$(CPP)  -openmp -o $@ $^ $(MKLLIBS)
peakdram.o: peakdram.cpp
peakdram.s: peakdram.cpp

latency: latency.exe latency.s
	echo 'latency done'
latency.exe: latency.o
	$(CPP)  -openmp -o $@ $^ $(MKLLIBS)
latency.o: latency.cpp
latency.s: latency.cpp

transpose: transpose.exe
	echo 'transpose done'
transpose.exe: drv-transpose.o transpose.o
drv-transpose.o: drv-transpose.cpp transpose.hh
transpose.o: transpose.cpp transpose.hh

fourier: fourier.exe
	echo 'fourier done'
fourier.exe: drv-Fourier.o Fourier1D.o
	$(CPP)  -openmp -o $@ $^ $(MKLLIBS) -L$$FFTW_LINK -lfftw3
drv-Fourier.o: drv-Fourier.cpp
Fourier1D.o: Fourier1D.cpp

stacksize.exe: stacksize.o dummy.o
	icpc  -o $@ $^
stacksize.o: stacksize.cpp
	icpc -O3 -c $<	

fcall: fcall.exe fcall0.s fcall1.s
	echo "fcall done"
fcall.exe: fcall0.o fcall1.o 
	gcc -o $@ $^
fcall0.o: fcall0.c
	gcc -O3 -c -fno-inline-functions $<
fcall1.o: fcall1.c
	gcc -O3 -c -fno-inline-functions $<
fcall0.s: fcall0.c
	gcc -O3 -S -fno-inline-functions $<
fcall1.s: fcall1.c
	gcc -O3 -S -fno-inline-functions $<



hanoi: hanoi.exe hanoi.s
	echo "hanoi done"
hanoi.exe: hanoi.c
	icc -O3 -fno-inline-functions -o $@ $<
hanoi.s: hanoi.c
	icc -O3 -S -fno-inline-functions $<

segf: segf.exe segf.s drv-segf.s
	echo "done segf"
segf.exe: drv-segf.o segf.o  
	icpc -o $@ $^
drv-segf.o: drv-segf.cpp
	icpc -fno-inline-functions -O0 -c $<
segf.o: segf.cpp
	icpc -fno-inline-functions -O0 -c $<
drv-segf.s: drv-segf.cpp
	icpc -S -O0 -c $<
segf.s: segf.cpp
	icpc -S -O0 -c $<

mreg: mreg.exe 
	echo "done mreg"
mreg.exe: drv-mreg.o mreg.o dummy.o 
	icpc -o $@ $^
drv-mreg.o: drv-mreg.cpp
	icpc -O0 -c $<
mreg.o: mreg.cpp
	icpc -O0 -c $<

p_print_mesg.exe: p_print_mesg.o
	icpc -o $@ $^ -lpthread
p_print_mesg.o:	p_print_mesg.cpp
	icpc -O3 -c $<
p_print_mesg.s: p_print_mesg.cpp
	icpc -S -O3 $<

p_leibniz.exe: p_leibniz.o
	icpc -o $@ $^ -lpthread 
p_leibniz.o: p_leibniz.cpp
	icpc -O3 -c $^

p_overhead.exe: p_overhead.o
	icpc -o $@ $^ -lpthread 
p_overhead.o: p_overhead.cpp
	icpc -O3 -c $^

p_fastadd.exe: p_fastadd.o
	icpc -o $@ $^ -lpthread 
p_fastadd.o: p_fastadd.cpp
	icpc -O3 -c $^

p_ompadd.exe: p_ompadd.o 
	icpc -o $@ $^ -fopenmp
p_ompadd.o: p_ompadd.cpp
	icpc -O3 -c $^ -fopenmp



##########
clean:
	rm *.exe; rm *.o; rm *.s;
cleanx:
	rm pbs*;
