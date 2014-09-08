include ../makevars.mk
CFLAGSXX := $(MKLINC) -openmp 
LIBS := $(MKLTHRD) 
MMIC := -mmic
export MMIC
MODS := ../utils


######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

fft.o: fft.cpp
-include fft.d

test_fft.o: test_fft.cpp
-include test_fft.d

time_fft.o: time_fft.cpp
-include time_fft.d

time_fft_mic.o: time_fft_mic.cpp
-include time_fft_mic.d

test_fft.exe: test_fft.o fft.o 			\
	      ../utils ../utils/utils.o

time_fft.exe: time_fft.o fft.o 			\
	      ../utils ../utils/utils.o ../utils/Table.o

time_fft_mic.exe: time_fft_mic.o fft.o 			\
		  ../utils ../utils/utils.o ../utils/Table.o

