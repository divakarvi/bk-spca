include ../makevars.mk

utils.o: ../utils/utils.cpp
	g++ -c -O3 -Drestrict=' ' $<

dummy.o: dummy.cpp
	g++ -c -O3 $<

######
altadd_omp.exe: altadd_omp.o utils.o
	g++ -o $@ $^ -fopenmp
altadd_omp.o: altadd_omp.cpp
	g++ -O3 -c -Drestrict=' ' $< -fopenmp

######
altadd_c.exe: altadd_c.o utils.o
	g++ -o $@ $^ -lpthread
altadd_c.o: altadd_c.cpp
	g++ -O3 -c -Drestrict=' ' $< 

######
altadd_mtx.exe: altadd_mtx.o utils.o
	g++ -o $@ $^ -lpthread
altadd_mtx.o: altadd_mtx.cpp
	g++ -O3 -c -Drestrict=' ' $< 

######
altadd_cond.exe: altadd_cond.o utils.o
	g++ -o $@ $^ -lpthread
altadd_cond.o: altadd_cond.cpp
	g++ -O3 -c -Drestrict=' ' $< 

######
altadd_spin.exe: altadd_spin.o dummy.o utils.o
	g++ -o $@ $^ -lpthread 
altadd_spin.o: altadd_spin.cpp
	g++ -O3 -fno-inline-functions -c -Drestrict=' ' $< 
altadd_spin.s: altadd_spin.cpp
	g++ -S -fno-verbose-asm -fno-inline-functions -Drestrict=' ' $<
