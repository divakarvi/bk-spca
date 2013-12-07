include ../makevars.mk
MODS := ../utils

###########
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

###########
leibniz_offl.o: leibniz_offl.cpp
-include leibniz_offl.d

leibniz_offl.s: leibniz_offl.cpp
-include leibniz_offl.d

leibniz_offl.exe: leibniz_offl.o