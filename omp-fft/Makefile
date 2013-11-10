include ../makevars.mk
CFLAGSXX := -openmp $(MKLINC)
LIBS := -openmp $(MKLLIBS)
MODS := ../utils ../linking-fft

#############
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

#############
fft_thrd.o: fft_thrd.cpp
-include fft_thrd.d

test_fft.o: test_fft.cpp
-include test_fft.d

test_fft.exe: test_fft.o fft_thrd.o				\
	      ../linking-fft ../linking-fft/fft_mkl.o

time_fft.exe: time_fft.o fft_thrd.o 				\
	      ../utils ../utils/utils.o ../utils/Table.o	\
	      ../linking-fft ../linking-fft/fft_mkl.o