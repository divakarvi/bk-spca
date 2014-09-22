include ../../makevars.mk
CFLAGS := $(CFLAGS) -fno-inline-functions
LIBS := 
MODS := ../../utils

######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ objl


######
sumcopy.o: sumcopy.cpp
-include sumcopy.d
test_sumcopy.o: test_sumcopy.cpp
-include test_sumcopy.d
time_sumcopy.o: time_sumcopy.cpp
-include time_sumcopy.d

######
test_sumcopy.exe: test_sumcopy.o sumcopy.o
time_sumcopy.exe: time_sumcopy.o sumcopy.o				\
		  ../../utils ../../utils/utils.o ../../utils/Table.o

