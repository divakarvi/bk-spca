include ../../root.mk
D := $(R)/mpi/diskio

#########
LIBS := -openmp $(MPILIBS)

#########
%.exe: 
	$(eval TMPTMP = $(CPP) $(EXTRNLL) -o $@ $(filter %.o,$^) $(LIBS))
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

########
include rules.mk
include $(R)/mpi/init/rules.mk

pagecache.exe: pagecache.cpp
	g++ -O3 -o $@ $<
time_serial.exe: $(D)/time_serial.o $(D)/serial.o $(D)/dummy.o
calc_latency.exe: $(D)/calc_latency.o $(D)/serial.o $(D)/dummy.o
test_lustre.exe: $(D)/test_lustre.o $(D)/lustre.o $(R)/mpi/init/mpi_init.o
time_lustre.exe: $(D)/time_lustre.o $(D)/lustre.o $(R)/mpi/init/mpi_init.o
