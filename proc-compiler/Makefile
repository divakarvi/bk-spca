include ../makevars.mk
CFLAGSXX := -fno-inline-functions

.PHONY: ../utils
../utils: 
	make --directory=$@ all

include leibniz.d
leibniz.o: leibniz.cpp
leibniz.exe: leibniz.o
leibniz.s: leibniz.cpp

include fusion.d
fusion.o: fusion.cpp
fusion.exe: fusion.o ../utils ../utils/Table.o 
fusion.s: fusion.cpp

include unrolljam.d
unrolljam.o: unrolljam.cpp
unrolljam.exe: unrolljam.o ../utils ../utils/Table.o
unrolljam.s: unrolljam.cpp

