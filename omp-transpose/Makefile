include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp $(MKLINC)
LIBS := -openmp $(MKLLIBS)
MODS := ../utils

##########
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all


##########
transpose.o: transpose.cpp
include transpose.d

test_trans.o: test_trans.cpp
include test_trans.d

test_trans.exe: test_trans.o transpose.o			\
		    ../utils ../utils/utils.o ../utils/Table.o

time_trans.o: time_trans.cpp
include time_trans.d

time_trans.exe: time_trans.o transpose.o			\
		    ../utils ../utils/utils.o ../utils/Table.o