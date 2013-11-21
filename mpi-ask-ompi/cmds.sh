icpc `mpiCC -showme:compile` -c procname.cpp
icpc `mpiCC -showme:link` -o procname.exe procname.o
qsub pbs_pnm.pbs