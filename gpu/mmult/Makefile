include ../makevars.mk
MODS := ../utils

######
.PHONY: $(MODS)
$(MODS):
	@echo
	make --directory=$@ objl
	@echo

######
mmult.o: mmult.cpp
test_mult.o: test_mult.cpp
time_mult.o: time_mult.cpp
cumult.o: cumult.cpp
test_cumult.o: test_cumult.cpp

######
test_mult.exe: test_mult.o mmult.o			\
	../utils ../utils/utils.o
time_mult.exe: time_mult.o mmult.o			\
	../utils ../utils/utils.o ../utils/Table.o
test_cumult.exe: LIBS := -lcublas
test_cumult.exe: test_cumult.o cumult.o			\
	../utils ../utils/utils.o
time_cumult.exe: LIBS := -lcublas
time_cumult.exe: time_cumult.o cumult.o			\
	../utils ../utils/utils.o ../utils/Table.o
