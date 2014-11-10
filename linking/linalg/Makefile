include ../../makevars.mk
CFLAGS := $(CFLAGS) $(MKLINC)
LIBS := $(LIBS) $(MKLLIBS)

######
.PHONY: ../../utils objl
../../utils:
	make --directory=$@ objl

######
objl: lusolve.o
lusolve.o: lusolve.cpp
-include lusolve.d
test_lusolve.o: test_lusolve.cpp
-include test_lusolve.d

######
test_lusolve.exe: test_lusolve.o lusolve.o ../../utils ../../utils/utils.o
