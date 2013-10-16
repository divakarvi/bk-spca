include ../makevars.mk
MODS := ../utils
CFLAGSXX := fno-inline-functions -fno-verbose-asm -openmp
LIBS := -openmp

###############
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

leibniz.o: leibniz.cpp
include leibniz.d

parallel.o: parallel.cpp
include parallel.d

for.o: for.cpp
include for.d

section.o: section.cpp
include section.d

time_leibniz.o: time_leibniz.cpp
include time_leibniz.d


time_leibniz.exe: time_leibniz.o leibniz.o parallel.o for.o section.o	\
		  ../utils ../utils/utils.o ../utils/Table.o
