include ../makevars.mk
CFLAGS := $(CFLAGS) $(MKLINC) #-offload-attribute-target=mic
LIBS := $(LIBS) $(MKLTHRD)
EXTRNL := -mmic
export EXTRNL
MODS := ../../utils ../init


######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ objl

######
mmult.o: mmult.cpp
-include mmult.d
time_mic.o: time_mic.cpp
-include time_mic.d

######
time_mic.exe: time_mic.o mmult.o					\
	       ../../utils ../../utils/utils.o ../../utils/Table.o	
