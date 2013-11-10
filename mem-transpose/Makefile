include ../makevars.mk
CFLAGSXX := $(MKLINC) -fno-inline-functions
LIBS := $(MKLLIBS)
MODS := ../utils

########################################
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all


########################################
transpose.o: transpose.cpp
-include transpose.d

test_transpose.o: test_transpose.cpp
-include test_transpose.d

test_transpose.exe: test_transpose.o transpose.o

time_transpose.o: time_transpose.cpp
-include time_transpose.d

time_transpose.exe: time_transpose.o transpose.o			\
		  ../utils ../utils/utils.o ../utils/Table.o

