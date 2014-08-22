include ../../root.mk
D := $(R)/mpi/cycle

#########
LIBS := $(MPILIBS)

#########
%.exe: 
	$(eval TMPTMP = $(CPP) $(EXTRNLL) -o $@ $(filter %.o,$^) $(LIBS))
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

########
include $(R)/utils/rules.mk
include $(R)/mpi/init/rules.mk
include rules.mk

test_cycle.exe: $(D)/test_cycle.o $(D)/cycle.o 		\
		$(R)/utils/utils.o				\
		$(R)/mpi/init/mpi_init.o

time_cycle.exe: $(D)/time_cycle.o $(D)/cycle.o		\
		$(R)/utils/utils.o $(R)/utils/Table.o	\
		$(R)/mpi/init/mpi_init.o