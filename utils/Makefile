include ../makevars.mk
CFLAGSXX := -fPIC

#########
all: utils.o Table.o

utils.o: utils.cpp
include utils.d

Table.o: Table.cpp
include Table.d

test_stat.o: test_stat.cpp
include test_stat.d

test_stat.exe: test_stat.o

test_table.o: test_table.cpp
include test_table.d

test_table.exe: test_table.o Table.o
#########

