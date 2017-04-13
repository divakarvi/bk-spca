include ../../makevars.mk
CFLAGS := $(CFLAGS) -fno-inline-functions $(MKLINC)
LIBS := $(LIBS) $(MKLLIBS)

######
.PHONY: ../../utils
../../utils: 
	@echo
	make --directory=$@ objl
	@echo

######
-include leibniz.d
leibniz.o: leibniz.cpp
leibniz.exe: leibniz.o
leibniz.s: leibniz.cpp

######
-include sincos.d
sincos.o: sincos.cpp
sincos.exe: sincos.o ../../utils ../../utils/Table.o 
sincos.s: sincos.cpp

######
-include sinetable.d
sinetable.o: sinetable.cpp
sinetable.exe: sinetable.o ../../utils ../../utils/Table.o
sinetable.s: sinetable.cpp

######
-include mult.d
mult.o: mult.cpp
-include time-mult.d
time-mult.o: time-mult.cpp
time-mult.exe: time-mult.o mult.o 			\
		../../utils 					\
		../../utils/Table.o 				\
		../../utils/utils.o 

######
-include cpp-mult.d
#-fno-inline-functions not used here
cpp-mult.o: cpp-mult.cpp
	$(CPP) $(CFLAGS) $(MKLINC) -c $<
cpp-mult.exe: cpp-mult.o ../../utils ../../utils/utils.o

