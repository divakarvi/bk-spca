include ../makevars.mk
CFLAGSXX := -openmp $(MKLINC) #-offload-attribute-target=mic
LIBS := -openmp $(MKLTHRD)
MMIC := #-mmic
export MMIC
MODS := ../utils ../xphi-init


######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

######
mmult.o: mmult.cpp
-include mmult.d

test_mult.o: test_mult.cpp
-include test_mult.d

test_mult.exe: test_mult.o mmult.o			\
	       ../xphi-init ../xphi-init/mic_init.o	\
	       ../utils ../utils/utils.o

time_mult.o: time_mult.cpp
-include time_mult.d

time_mult.exe: time_mult.o mmult.o			\
	       ../utils ../utils/utils.o ../utils/Table.o

