#########
saved := $(D)
D := $(R)/utils

#########
$(D)CFLAGS := $(CFLAGS) -fPIC

#########
$(D)/%.o: $(D)/%.cpp
	$(eval TMPTMP = $(CPP) $($(@D)CFLAGS) $($(@D)EXTRNL) -o $@ -c $<)
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)
$(D)/%.s: $(D)/%.cpp 
	$(eval TMPTMP = $(CPP) $($(@D)CFLAGS) -fno-verbose-asm  \
	$($(@D)EXTRNL) -o $@ -S $<)
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)
$(D)/%.o: $(D)/%.s 
	$(CPP) $($(@D)CFLAGS) $($(@D)EXTRNL) -o $@ -c $< 
	@echo $(subst $(R)/, , $(TMPTMP))
	@ $(TMPTMP)

#########
$(D)/utils.o: $(D)/utils.cpp
-include $(D)/utils.d

$(D)/Table.o: $(D)/Table.cpp
-include $(D)/Table.d

$(D)/test_stat.o: $(D)/test_stat.cpp
-include $(D)/test_stat.d

$(D)/test_table.o: $(D)/test_table.cpp
-include $(D)/test_table.d

#########
D := $(saved)