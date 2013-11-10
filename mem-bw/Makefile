include ../makevars.mk
CFLAGSXX := $(MKLINC) -fno-inline-functions
LIBS := $(MKLLIBS)
MODS := ../utils

########################################
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all


########################################
sumcopy.o: sumcopy.cpp
-include sumcopy.d

test_sumcopy.o: test_sumcopy.cpp
-include test_sumcopy.d

test_sumcopy.exe: test_sumcopy.o sumcopy.o

time_sumcopy.o: time_sumcopy.cpp
-include time_sumcopy.d

time_sumcopy.exe: time_sumcopy.o sumcopy.o			\
		  ../utils ../utils/utils.o ../utils/Table.o

