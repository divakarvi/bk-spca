include ../makevars.mk
CFLAGSXX := $(MKLINC) -openmp 
LIBS := $(MKLTHRD) 
MMIC := -mmic
export MMIC
MODS := ../utils


#########
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

fft.o: fft.cpp
-include fft.d

test_fft.o: test_fft.cpp
-include test_fft.d

test_fft.exe: test_fft.o fft.o 			\
	      ../utils ../utils/utils.o

complex_dft_1d.exe: complex_dft_1d.o