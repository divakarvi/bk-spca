include ../makevars.mk
CFLAGSXX := -fno-inline-functions

test_easy.exe: test_easy.o
test_easy.o: test_easy.cpp
test_easy.s: test_easy.cpp
include test_easy.d

addxmm.exe: addxmm.o
addxmm.o: addxmm.cpp
include addxmm.d

addmultxmm.exe: addmultxmm.o
addmultxmm.o: addmultxmm.cpp
include addmultxmm.d