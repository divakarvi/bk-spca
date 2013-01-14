
.SUFFIXES: .cpp .c .o

.cpp.o:
	icpc -O3 -prec-div -no-ftz  -fno-inline-functions -DNDEBUG -c $< -I $$FFTW_INC -I$$MKL_INC
.f.o:
	ifort -O3 -prec-div -no-ftz  -fno-inline-functions -DNDEBUG -c $< 
.c.o:
	icc  -O3 -prec-div -no-ftz  -fno-inline-functions -DNDEBUG -c  $<

all: leibniz logseries leibnizf logseriesf Leibniz LogSeries leibniz leibnizFinC leibnizFinCPP testLinAlgFourier

###########
leibniz: leibniz.o aitken.o
	icc  -o leibniz.exe leibniz.o aitken.o

logseries: logseries.o aitken.o
	icc  -o logseries.exe logseries.o aitken.o -lm

aitken.o: aitken.c aitken.h

leibniz.o: leibniz.c aitken.h

logseries.o: logseries.c aitken.h

###########
leibnizf: leibnizf.o aitkenf.o
	ifort -v -o leibnizf.exe leibnizf.o aitkenf.o 

logseriesf: logseriesf.o aitkenf.o
	ifort -o logseriesf.exe logseriesf.o aitkenf.o 

aitkenf.o: aitkenf.f 

leibnizf.o: leibnizf.f

logseriesf.o: logseriesf.f

###########
Leibniz: Leibniz.o Aitken.o
	icpc  -o Leibniz.exe Leibniz.o Aitken.o -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread

LogSeries: LogSeries.o Aitken.o
	icpc -o LogSeries.exe LogSeries.o Aitken.o -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread

Aitken.o: Aitken.cpp Aitken.hh

Leibniz.o: Leibniz.cpp Aitken.hh

LogSeries.o: LogSeries.cpp Aitken.hh


##########
leibnizFinC: leibnizFinC.o aitkenf.o
	icc -o leibnizFinC.exe leibnizFinC.o aitkenf.o -lifcore #-L/usr/caen/intel-12.0//composerxe-2011.0.084/compiler/lib/intel64/ -lifcore 

leibnizFinC.o: leibnizFinC.c

##########
leibnizFinCPP: leibnizFinCPP.o aitkenf.o
	icpc -o leibnizFinCPP.exe leibnizFinCPP.o aitkenf.o -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lifcore #-L/usr/caen/intel-12.0//composerxe-2011.0.084/compiler/lib/intel64/ -lifcore 

leibnizFinCPP.o: leibnizFinCPP.cpp

##########
CPP = icpc
DFLAGS = -g -DDEBUG  -I $$FFTW_INC -I$$MKL_INC -c 
OFLAGS = -O3 -prec-div -no-ftz -DNDEBUG -I $$FFTW_INC -I$$MKL_INC -c 
CFLAGS = $(OFLAGS)
LINK = icpc
MKLLIBS= -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread #from link advisor
FFTWLIB =  -L $$FFTW_LINK -lfftw3

###########
LinAlg.o: LinAlg.cpp Vector.hh Matrix.hh
	$(CPP) $(CFLAGS) LinAlg.cpp

Fourier1D.o: Fourier1D.cpp cVector.hh 
	$(CPP) $(CFLAGS) Fourier1D.cpp

testLinAlgFourier.o: testLinAlgFourier.cpp
	$(CPP) $(CFLAGS) testLinAlgFourier.cpp

testLinAlgFourier: testLinAlgFourier.o LinAlg.o Fourier1D.o
	$(LINK) -o testLinAlgFourier.exe testLinAlgFourier.o LinAlg.o Fourier1D.o $(MKLLIBS) $(FFTWLIB)

###########
clean:
	rm *.o; rm *.a; rm a.out; rm *.exe; rm *.so;

