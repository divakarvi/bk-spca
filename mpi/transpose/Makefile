include ../../root.mk
D := $(R)/mpi/transpose

#########
LIBS := $(MPILIBS) -openmp

#########
%.exe: 
	$(eval TMPTMP = $(CPP) $(EXTRNLL) -o $@ $(filter %.o,$^) $(LIBS))
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

########
include rules.mk
include $(R)/utils/rules.mk
include $(R)/mpi/init/rules.mk
test_trans.exe: $(D)/test_trans.o $(D)/trans.o $(D)/fast_trans.o $(D)/timer.o\
		$(R)/utils/utils.o					     \
		$(R)/mpi/init/mpi_init.o
time_trans.exe: $(D)/time_trans.o $(D)/trans.o $(D)/fast_trans.o $(D)/timer.o\
		$(R)/utils/utils.o					     \
		$(R)/mpi/init/mpi_init.o