#
# see Makefile_mic.mk for time_fft_mic.exe
#

include ../makevars.mk
CFLAGS := $(CFLAGS) $(MKLINC)
LIBS := $(LIBS) $(MKLTHRD)
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
time_fft.o: time_fft.cpp
-include time_fft.d

######
test_fft.exe: test_fft.o fft.o 						\
	      ../../utils ../../utils/utils.o

time_fft.exe: time_fft.o fft.o 						\
	      ../../utils ../../utils/utils.o ../../utils/Table.o



