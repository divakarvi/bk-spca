include ../../root.mk
D := $(R)/mpi/exchange

#########
LIBS := $(MPILIBS)

#########
%.exe: 
	$(eval TMPTMP = $(CPP) $(EXTRNLL) -o $@ $(filter %.o,$^) $(LIBS))
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

########
include rules.mk
include $(R)/utils/rules.mk
include $(R)/mpi/init/rules.mk
test_xchg.exe: $(D)/test_xchg.o $(D)/exchange.o 			\
	       $(R)/utils $(R)/utils/utils.o				\
	       $(R)/mpi/init/mpi_init.o
time_xchg.exe: $(D)/time_xchg.o $(D)/exchange.o 			\
	       $(R)/utils/utils.o $(R)/utils/Table.o			\
	       $(R)/mpi/init/mpi_init.o
