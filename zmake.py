#!/usr/bin/env python
import os
l = os.listdir('.')
for x in l:
    if(os.path.isdir(x) and x[0] != 'z'):
        print '\n\n'
        print 'in directory: ', x
        os.chdir(x)
        if 'Makefile' in os.listdir('.'):
                os.system(
                        """sed 's/^include/-include/g' Makefile > tmp.mk;
                           sed '1s/-include/include/g' tmp.mk > Makefile;
                           rm tmp.mk""")
        print 'exit from directory: ', x
        os.chdir('..')
        
