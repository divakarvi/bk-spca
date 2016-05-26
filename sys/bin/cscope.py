#!/usr/bin/env python
import os, sys

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('Usage: cscope.py dirname')
        sys.exit(0)

    ddir = sys.argv[1]
    assert os.path.isdir(ddir)
    cmd = 'rm -rf cscope.*'
    print(cmd)
    os.system(cmd)

    cmd = 'find ' + ddir \
          + ' -name *.h'  + ' -o -name *.hh'\
          + ' -o -name *.c' +' -o -name *.cpp' + ' > cscope.files'
    print(cmd)
    os.system(cmd)

    cmd = 'cscope -b -q'
    print(cmd)
    os.system(cmd)
