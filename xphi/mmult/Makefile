#
# use Makefile_mic.mk for building time_mic.exe
#

include ../makevars.mk
CFLAGS := $(CFLAGS) $(MKLINC) #-offload-attribute-target=mic
LIBS := $(LIBS) $(MKLTHRD)
export EXTRNL
MODS := ../../utils ../init

######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ objl

######
mmult.o: mmult.cpp
-include mmult.d
test_mult.o: test_mult.cpp
-include test_mult.d
time_mult.o: time_mult.cpp
-include time_mult.d

######
test_mult.exe: test_mult.o mmult.o					\
	       ../init ../init/mic_init.o				\
	       ../../utils ../../utils/utils.o
time_mult.exe: time_mult.o mmult.o					\
	       ../init ../init/mic_init.o				\
	       ../../utils ../../utils/utils.o ../../utils/Table.o

