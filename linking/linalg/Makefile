include ../../makevars.mk
CFLAGS := $(CFLAGS) $(MKLINC)
LIBS := $(LIBS) $(MKLLIBS)

######
.PHONY: ../../utils objl
../../utils:
	make --directory=$@ objl

######
objl: lusolve.o
array_2d.o: array_2d.c
	gcc -c $<
lusolve.o: lusolve.cpp
-include lusolve.d
test_lusolve.o: test_lusolve.cpp
-include test_lusolve.d

######
array_2d.exe: array_2d.o
test_lusolve.exe: test_lusolve.o lusolve.o ../../utils ../../utils/utils.o
