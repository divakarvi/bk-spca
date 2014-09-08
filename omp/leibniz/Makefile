include ../makevars.mk
MODS := ../../utils

######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ objl

######
leibniz.o: leibniz.cpp
-include leibniz.d
parallel.o: parallel.cpp
-include parallel.d
ompfor.o: ompfor.cpp
-include ompfor.d
section.o: section.cpp
-include section.d
time_leibniz.o: time_leibniz.cpp
-include time_leibniz.d

######
time_leibniz.exe: time_leibniz.o leibniz.o parallel.o ompfor.o section.o\
		  ../../utils ../../utils/utils.o ../../utils/Table.o
