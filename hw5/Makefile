include ../makevars.mk
CFLAGSXX := -openmp
LIBS := -openmp
MODS := ../utils

######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

######
transpose.o: transpose.cpp
-include transpose.d

transpose.exe: transpose.o 					\
	       ../utils ../utils/utils.o ../utils/Table.o