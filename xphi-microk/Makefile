include ../makevars.mk
CFLAGSXX := -openmp -fno-inline-functions
LIBS := -openmp
MMIC := -mmic
export MMIC
MODS := ../utils

######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all
######

test_instn.o: test_instn.cpp
-include test_instn.d

test_instn.exe: test_instn.o fma7.o

test_asm.o: test_asm.cpp
-include test_asm.d

test_asm.exe: test_asm.o 			\
	      asm8x1x8.o 			\
	      asm8x12x8.o			\
	      asm8x24x8.o			\
	      asm8x36x8.o			\
	      asm8x48x8.o			\
	      ../utils  ../utils/utils.o

time_asm.o: time_asm.cpp
-include time_asm.d

time_asm.exe: time_asm.o 					\
	      asm8x1x8.o 					\
	      asm8x12x8.o					\
	      asm8x24x8.o					\
	      asm8x36x8.o					\
	      asm8x48x8.o					\
	      ../utils  ../utils/utils.o ../utils/Table.o