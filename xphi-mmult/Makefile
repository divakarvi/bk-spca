include ../makevars.mk
CFLAGSXX :=-openmp $(MKLINC) #-offload-attribute-target=mic
LIBS := -openmp $(MKLTHRD)
MODS := ../utils ../xphi-init


##########
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

#########
mmult.o: mmult.cpp
-include mmult.d

test_mult.o: test_mult.cpp
-include test_mult.d

test_mult.exe: test_mult.o mmult.o			\
	       ../xphi-init ../xphi-init/mic_init.o	\
	       ../utils ../utils/utils.o	