include ../../makevars.mk
CFLAGS := $(CFLAGS) -fPIC $(MKLINC) $(FFTWINC)
LIBS := $(LIBS) $(MKLLIBS) $(FFTWLIBS)
MODS := ../../utils ../../pyplot 

######
.PHONY: $(MODS)
$(MODS):
	@echo
	make --directory=$@ objl
	@echo

######
.PHONY: objl
objl: fft_mkl.o fft_fftw.o nr.o
fft_mkl.o: fft_mkl.cpp
-include fft_mkl.d
fft_fftw.o: fft_fftw.cpp
-include fft_fftw.d
nr.o: nr.cpp
-include nr.d
test_fft.o: test_fft.cpp
-include test_fft.d
time_fft.o: time_fft.cpp
-include time_fft.d
time_fft.s: time_fft.cpp
hist_fft.o: hist_fft.cpp
-include hist_fft.d

######
test_fft.exe: test_fft.o fft_mkl.o fft_fftw.o nr.o 		\
	      ../../utils ../../utils/utils.o
time_fft.exe: time_fft.o fft_mkl.o fft_fftw.o nr.o		\
	      ../../utils ../../utils/utils.o ../../utils/Table.o
hist_fft.exe: hist_fft.o fft_mkl.o				\
	       ../../utils ../../utils/utils.o			\
	       ../../pyplot ../../pyplot/pyhist.o