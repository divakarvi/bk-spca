include ../makevars.mk
MODS := ../../utils ../init


######
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ objl

######
dummy.o: dummy.cpp
-include dummy.d
offl.o: offl.cpp
-include offl.d
time_offl.o: time_offl.cpp
-include time_offl.d

######
time_offl.exe: time_offl.o offl.o dummy.o				\
	       ../../utils ../../utils/utils.o ../../utils/Table.o	\
	       ../init ../init/mic_init.o