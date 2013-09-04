FFTW := true
include ../makevars.mk
LIBS := $(MKLLIBS) $(FFTWLIBS)

##################################################
.PHONY: ../utils ../pyplot

../utils:
	make --directory=$@ all

../pyplot:
	make --directory=$@ all
##################################################
fft_mkl.o: fft_mkl.cpp
include fft_mkl.d

fft_fftw.o: fft_fftw.cpp
include fft_fftw.d

nr.o: nr.cpp
include nr.d

test_fft.o: test_fft.cpp
include test_fft.d

time_fft.o: time_fft.cpp
include time_fft.d

test_fft.exe: test_fft.o fft_mkl.o fft_fftw.o nr.o 		\
	      ../utils ../utils/utils.o

time_fft.exe: time_fft.o fft_mkl.o fft_fftw.o nr.o		\
	      ../utils ../utils/utils.o				\
	      ../pyplot ../pyplot/pyplot.o