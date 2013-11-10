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
                           mv tmp.mk Makefile""")
        print 'exit from directory: ', x
        os.chdir('..')
        
