include ../makevars.mk
MODS := ../utils

######
.PHONY: $(MODS)
$(MODS):
	@echo
	make --directory=$@ objl
	@echo

######
add.o: add.cu
copy.o: copy.cu
time_addcopy.o: time_addcopy.cpp

######
time_addcopy.exe: time_addcopy.o add.o copy.o			\
	../utils ../utils/utils.o ../utils/Table.o
