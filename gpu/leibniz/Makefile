include ../makevars.mk
MODS := ../utils

######
.PHONY: $(MODS)
$(MODS):
	@echo
	make --directory=$@ objl
	@echo

######
leibniz_all.o: leibniz_all.cu
leibniz.o: leibniz.cu
atomicAdd.o: atomicAdd.cu
time_leibniz.o: time_leibniz.cpp

######
leibniz_all.exe: leibniz_all.o 
time_leibniz.exe: time_leibniz.o atomicAdd.o leibniz.o		\
	../utils ../utils/Table.o ../utils/utils.o
