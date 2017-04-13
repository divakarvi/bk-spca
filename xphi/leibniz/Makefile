include ../makevars.mk
MODS := ../../utils ../init

######
.PHONY: $(MODS)
$(MODS):
	@echo
	make --directory=$@ objl
	@echo

######
leibniz_init.o: leibniz_init.cpp
leibniz_init.s: leibniz_init.cpp
-include leibniz_init.d
leibniz.o: leibniz.cpp
leibniz.s: leibniz.cpp
-include leibniz.d

######
leibniz.exe: leibniz.o leibniz_init.o 			\
	      ../init ../init/mic_init.o

