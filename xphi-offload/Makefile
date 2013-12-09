include ../makevars.mk
CFLAGSXX := -openmp
LIBS := -openmp
MODS := ../utils ../xphi-init


##########
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

#########
dummy.o: dummy.cpp
-include dummy.d

offl.o: offl.cpp
-include offl.d

time_offl.o: time_offl.cpp
-include time_offl.d

time_offl.exe: time_offl.o offl.o dummy.o			\
	       ../utils ../utils/utils.o ../utils/Table.o	\
	       ../xphi-init ../xphi-init/mic_init.o