include ../makevars.mk
CFLAGSXX := $(MKLINC)
LIBS := $(MKLLIBS)
MODS := ../utils

########################################
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all


########################################
sum_copy.o: sum_copy.cpp
include sum_copy.d

test_sumcopy.o: test_sumcopy.cpp
include test_sumcopy.d

test_sumcopy.exe: test_sumcopy.o sum_copy.o

time_sumcopy.o: time_sumcopy.cpp
include time_sumcopy.d

time_sumcopy.exe: time_sumcopy.exe sumcopy.exe			\
		  ../utils ../utils/utils.o ../utils/Table.o

