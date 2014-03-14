#!/usr/bin/env python
from __future__ import print_function

skipfile = ['mkl', 'utils.hh', 'kozen.c', 'dcopy.cu']
skipdir = ['lonestar']
prefix = """\
/*
 * Copyright Divakar Viswanath, 2009-2014
 */

/*     
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as 
 * published by the Free Software Foundation.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

"""
def gplnotice(fname):
    tmp = 'tmppppp.tmp'
    import os
    assert not os.path.isfile(tmp)
    assert not os.path.isdir(tmp)

    f1 = open(fname, 'r')
    f2 = open(tmp, 'w')
    
    f2.write(prefix)
    for line in f1:
        f2.write(line)

    f1.close()
    f2.close()

    cmd = 'rm '+fname
    print(cmd)
    os.system(cmd)
    cmd = 'mv '+tmp+' '+fname
    print(cmd)
    os.system(cmd)


def verify(exlist, s):
    """
    return true if no entry of exlist occurs in string s
    else return if false
    """
    assert isinstance(s, str)
    for ss in exlist:
        if ss in s:
            return False

    return True


def recurse():
    import os
    for dirr, dlist, flist in os.walk('.'):
        if '.git' in dirr:
            continue
        if not verify(skipdir, dirr):
            continue
        for fname in flist:
            if not verify(skipfile, fname):
                continue
            if '.h' in fname or '.c' in fname or '.hh' in fname or \
                    '.cpp' in fname or '.cu' in fname:
                fullname = os.path.join(dirr, fname)
                gplnotice(fullname)
            
            

if __name__ == '__main__':
    import sys
    if(len(sys.argv) > 1):
        gplnotice(sys.argv[1])
    else:
        recurse()
