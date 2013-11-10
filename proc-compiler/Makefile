-include ../makevars.mk
CFLAGSXX := -fno-inline-functions $(MKLINC)
LIBS := $(MKLLIBS)

.PHONY: ../utils
../utils: 
	make --directory=$@ all

-include leibniz.d
leibniz.o: leibniz.cpp
leibniz.exe: leibniz.o
leibniz.s: leibniz.cpp

-include fusion.d
fusion.o: fusion.cpp
fusion.exe: fusion.o ../utils ../utils/Table.o 
fusion.s: fusion.cpp

-include unrolljam.d
unrolljam.o: unrolljam.cpp
unrolljam.exe: unrolljam.o ../utils ../utils/Table.o
unrolljam.s: unrolljam.cpp

-include xchg-mult.d
xchg-mult.o: xchg-mult.cpp

-include xchg-timer.d
xchg-timer.o: xchg-timer.cpp
xchg-timer.exe: xchg-timer.o xchg-mult.o 			\
		../utils 					\
		../utils/Table.o 				\
		../utils/utils.o 


-include cpp-mult.d
#-fno-inline-functions not used here
cpp-mult.o: cpp-mult.cpp
	$(CPP) $(CFLAGS) $(MKLINC) -c $<
cpp-mult.exe: cpp-mult.o ../utils ../utils/utils.o
