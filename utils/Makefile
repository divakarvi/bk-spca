include ../root.mk
D := $(R)/utils

#########
LIBS := 

#########
%.exe: 
	$(eval TMPTMP = $(CPP) $(EXTRNLL) -o $@ $(filter %.o,$^) $(LIBS))
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

########
include rules.mk
utils.o: $(D)/utils.o
test_stat.exe: $(D)/test_stat.o
test_table.exe: $(D)/test_table.o $(D)/Table.o