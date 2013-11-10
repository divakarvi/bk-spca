-include ../makevars.mk

thrd_create_ovhd.o: thrd_create_ovhd.cpp
	g++ -c -O3 -Drestrict=' ' $<
utils.o: ../utils/utils.cpp
	g++ -c -O3 -Drestrict=' ' $<
thrd_create_ovhd.exe: thrd_create_ovhd.o utils.o
	g++ -o $@ $^ -lpthread