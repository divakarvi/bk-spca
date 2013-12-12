include ../makevars.mk
CFLAGSXX := -openmp
LIBS := -openmp
MODS := ../utils ../xphi-init

###########
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

###########
leibniz_init.o: leibniz_init.cpp
leibniz_init.s: leibniz_init.cpp
-include leibniz_init.d

leibniz.o: leibniz.cpp
leibniz.s: leibniz.cpp
-include leibniz.d

leibniz.exe: leibniz.o leibniz_init.o 			\
	      ../xphi-init ../xphi-init/mic_init.o
