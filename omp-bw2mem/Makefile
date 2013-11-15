include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp 
LIBS := -openmp 
MODS := ../utils

############
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

############
readwrcopy.o: readwrcopy.cpp
-include readwrcopy.d

test_rwc.o: test_rwc.cpp
-include test_rwc.d

test_rwc.exe: test_rwc.o readwrcopy.o 				\
	      ../utils ../utils/utils.o

time_rwc.o: time_rwc.cpp
-include time_rwc.d

time_rwc.exe: time_rwc.o readwrcopy.o				\
	      ../utils ../utils/utils.o ../utils/Table.o