include ../makevars.mk
CFLAGS := $(CFLAGS) $(MKLINC)
LIBS := $(LIBS) $(MKLTHRD)
EXTRNL := -mmic
export EXTRNL
MODS := ../../utils


######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ objl

######
fft.o: fft.cpp
-include fft.d
test_fft.o: test_fft.cpp
-include test_fft.d
time_fft_mic.o: time_fft_mic.cpp
-include time_fft_mic.d

######
test_fft.exe: test_fft.o fft.o 						\
	      ../../utils ../../utils/utils.o

time_fft_mic.exe: time_fft_mic.o fft.o 					\
		  ../../utils ../../utils/utils.o ../../utils/Table.o


