include ../makevars.mk
CFLAGSXX := -openmp $(MKLINC) #-offload-attribute-target=mic
LIBS := -openmp $(MKLTHRD)
MMIC := -mmic
export MMIC
MODS := ../utils ../xphi-init


##########
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

#########
time_mic.o: time_mic.cpp
-include time_mic.d

time_mic.exe: time_mic.o mmult.o			\
	       ../utils ../utils/utils.o ../utils/Table.o	