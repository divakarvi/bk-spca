include ../../root.mk
D := $(R)/mpi/intro

ifeq ($(MPION), yes)
	CPP := $(MPICC)
endif

#########
LIBS := $(MPILIBS)

#########
%.exe: 
	$(eval TMPTMP = $(CPP) $(EXTRNLL) -o $@ $(filter %.o,$^) $(LIBS))
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

########
include $(D)/rules.mk
procname.exe: $(D)/procname.o