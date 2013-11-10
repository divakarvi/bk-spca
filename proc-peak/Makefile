-include ../makevars.mk
CFLAGSXX := -fno-inline-functions

test_easy.exe: test_easy.o
test_easy.o: test_easy.cpp
test_easy.s: test_easy.cpp
-include test_easy.d

addxmm.exe: addxmm.o
addxmm.o: addxmm.cpp
addxmm.s: addxmm.cpp
-include addxmm.d

addmultxmm.exe: addmultxmm.o
addmultxmm.o: addmultxmm.cpp
addmultxmm.s: addmultxmm.cpp
-include addmultxmm.d

peak_onlyreg.exe: peak_onlyreg.o
peak_onlyreg.o: peak_onlyreg.cpp
peak_onlyreg.s: peak_onlyreg.cpp
-include peak_onlyreg.d

peak_withloads.exe: peak_withloads.o
peak_withloads.o: peak_withloads.cpp
peak_withloads.s: peak_withloads.cpp
-include peak_withloads.d

peak_loadnstore.exe: peak_loadnstore.o
peak_loadnstore.o: peak_loadnstore.cpp
peak_loadnstore.s: peak_loadnstore.cpp
-include peak_loadnstore.d