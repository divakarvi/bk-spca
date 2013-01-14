##########
CPP = icpc
DFLAGS = -g -DDEBUG -fpic -I$$FFTW_INC -I$$MKL_INC -c
OFLAGS = -O3 -prec-div -no-ftz -DNDEBUG -fpic -I$$FFTW_INC -I$$MKL_INC -c
CFLAGS = $(OFLAGS)
MKLLIBS= -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread #from link advisor
FFTWLIB =  -L $$FFTW_LINK -lfftw3

##########

.SUFFIXES: .cpp .o

%.o:%.cpp
	icpc $(CFLAGS) -c $<


all: libLinF.so testLinAlgFourier


###########
libLinF.so: LinAlg.o Fourier1D.o
	icpc -shared -o libLinF.so LinAlg.o Fourier1D.o 

###########
LinAlg.o: LinAlg.cpp Vector.hh Matrix.hh
Fourier1D.o: Fourier1D.cpp cVector.hh 


###########
testLinAlgFourier.o: testLinAlgFourier.cpp
testLinAlgFourier: testLinAlgFourier.o LinAlg.o Fourier1D.o
	icpc -o testLinAlgFourier.exe testLinAlgFourier.o -L$$HOME/bq-linking -lLinF $(MKLLIBS) $(FFTWLIB)

###########
clean:
	rm *.o; rm *.a; rm a.out; rm *.exe; rm *.so;

