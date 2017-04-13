include ../makevars.mk
MODS := ../../utils

######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ objl

######
readwrcopy.o: readwrcopy.cpp
-include readwrcopy.d
test_rwc.o: test_rwc.cpp
-include test_rwc.d
time_rwc.o: time_rwc.cpp
-include time_rwc.d

######
test_rwc.exe: test_rwc.o readwrcopy.o 				\
	      ../../utils ../../utils/utils.o
time_rwc.exe: time_rwc.o readwrcopy.o				\
	      ../../utils ../../utils/utils.o ../../utils/Table.o
