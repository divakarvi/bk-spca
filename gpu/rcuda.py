#! /usr/bin/env python
import sys
import os
inlist= sys.argv
if((inlist[1]!='-f')):
    print 'Usage: '+inlist[0]+' -f fname exec arglist'
else:
    fname = 'pbs_'+inlist[2]
    execname = inlist[3]
    if(len(inlist)<5):
        args = ''
    else:
        args = inlist[4:]
    arglist = ''
    for x in args:
        arglist = arglist+' '+x   
    file = open(fname+'.pbs','w');
    file.write('#!/bin/sh\n');
    file.write('#PBS -N '+fname+'\n');
    file.write('#PBS -l nodes=1,mem=1gb,walltime=0:14:00,software=graphics\n');
    file.write('#PBS -V\n');
    file.write('\n\n');
    currentdir = os.getcwd();
    file.write('cd '+currentdir+'\n');
    file.write('cat $PBS_NODEFILE >> '+currentdir+'/'+fname+'.txt\n');
    file.write(execname+' '+arglist+' >> '+currentdir+'/'+fname+'.txt\n');
    file.close();
    os.execvp('qsub',['qsub',fname+'.pbs']);
