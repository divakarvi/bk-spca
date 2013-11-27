include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp $(MPIINC)
LIBS := -openmp $(MPILIBS)
MODS := ../utils ../mpi-init

######
.PHONY: $(MODS)

$(MODS):
	make --directory=$@ all

######
pagecache.exe: pagecache.cpp
	g++ -O3 -o $@ $^