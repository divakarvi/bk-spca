include ../../root.mk
D := $(R)/mpi/init

#########
LIBS := 

#########
%.exe: 
	$(eval TMPTMP = $(CPP) $(EXTRNLL) -o $@ $(filter %.o,$^) $(LIBS))
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

########
include rules.mk
mpi_init.o: $(D)/mpi_init.o