include root.mk
D := $(R)

#########
LIBS := 

#########
%.exe: 
	$(eval TMPTMP = $(CPP) $(EXTRNLL) -o $@ $(filter %.o,$^) $(LIBS))
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

########