#!/usr/bin/env python
import os
l = os.listdir('.')
for x in l:
    if(os.path.isdir(x) and x[0] != 'z'):
        print '\n\n'
        print 'in directory: ', x
        os.chdir(x)
        os.system('make cleanxx')
        print 'exit from directory: ', x
        os.chdir('..')
        
