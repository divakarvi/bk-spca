#!/usr/bin/env python
import os
root = os.path.abspath('.')
print root
for path, dnames, fnames in os.walk('.'):
    if path.find('git') == -1 and fnames.count('Makefile') > 0:
        os.chdir(path)
        print 'in ' + path
        os.system('make cleanxx')
        os.chdir(root)



        
