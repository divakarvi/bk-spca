-include ../makevars.mk
CFLAGSXX := -fno-inline-functions -fno-verbose-asm -openmp
LIBS := -openmp
MODS := ../utils

#############
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

#############

printstuff.o: printstuff.cpp
-include printstuff.d

printstuff.exe: printstuff.o


volatile.o: volatile.cpp
-include volatile.d

test_volatile.o: test_volatile.cpp
-include test_volatile.d

test_volatile.exe: test_volatile.o volatile.o 			\
		   ../utils ../utils/utils.o

critical.o: critical.cpp
-include critical.d

test_critical.o: test_critical.cpp
-include test_critical.d

test_critical.exe: test_critical.o critical.o			\
		   ../utils ../utils/utils.o ../utils/Table.o
