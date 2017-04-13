.PHONY: objl
objl: utils.o Table.o
utils.o: ../../utils/utils.cpp
	g++ -Drestrict="__restrict__" -c $<
Table.o: ../../utils/Table.cpp
	g++ -Drestrict="__restrict__" -c $<
