#!/usr/bin/env python
import os
curdir = os.path.abspath('.')
root = os.getenv('HOME')
assert root != None
root = root + '/git/Programs/bk-spca/'
print root
for path, dnames, fnames in os.walk(root):
    if path.find('.git') == -1 and fnames.count('Makefile') > 0:
        os.chdir(path)
        print 'in ' + path
        os.system('make cleanxx')
        os.chdir(root)
os.chdir(root)


        
