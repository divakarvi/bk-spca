include ../makevars.mk
LIBS := $(MKLLIBS)
CFLAGSXX := -fno-inline-functions $(MKLINC)
MODS := ../utils ../proc-microk

#########################
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

blockmult.o: blockmult.cpp
include blockmult.d

test_utils.o: test_utils.cpp
include test_utils.d

test_block.o: test_block.cpp
include test_block.d

time_block.o: time_block.cpp
include time_block.d

test_block.exe: test_block.o blockmult.o test_utils.o		\
		../proc-microk ../proc-microk/asm4x200x4.o	\
		../utils ../utils/utils.o

time_block.exe: time_block.o blockmult.o 			\
		../proc-microk ../proc-microk/asm4x200x4.o	\
		../utils ../utils/utils.o ../utils/Table.o