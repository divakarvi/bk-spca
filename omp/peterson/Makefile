include ../makevars.mk
MODS := ../../utils

#############
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ objl

######
printstuff.o: printstuff.cpp
-include printstuff.d
volatile.o: volatile.cpp
-include volatile.d
test_volatile.o: test_volatile.cpp
-include test_volatile.d
critical.o: critical.cpp
-include critical.d
test_critical.o: test_critical.cpp
-include test_critical.d

######
test_volatile.exe: test_volatile.o volatile.o 
printstuff.exe: printstuff.o
test_critical.exe: test_critical.o critical.o			\
		   ../../utils ../../utils/utils.o ../../utils/Table.o
