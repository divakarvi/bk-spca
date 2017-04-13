#!/usr/bin/env python

def rmgpl(fname):
    tmp = 'tmppppp.tmp'
    import os
    assert not os.path.isfile(tmp)
    assert not os.path.isdir(tmp)

    f1 = open(fname, 'r')
    l1 = f1.readline()
    l2 = f1.readline()
    l3 = f1.readline()
    s = 'Divakar'
    if s in l1 or s in l2 or s in l3:
        print('removing gpl: '+fname)
        for line in f1:
            if 'GNU General Public License for more details.' in line:
                break
        line = f1.readline()
        assert line == ' */\n'
        line = f1.readline()
        f2 = open(tmp, 'w')
        if line != '\n':
            f2.write(line)
        for line in f1:
            f2.write(line)
        f2.close()
        f1.close()
        cmd = 'rm '+fname
        print(cmd)
        os.system(cmd)
        cmd = 'mv '+tmp+' '+fname
        print(cmd)
        os.system(cmd)
    else:
        print(fname + ' not copyrighted')
        f1.close()

def recurse():
    import os
    for dirr, dlist, flist in os.walk('.'):
        if '.git' in dirr:
            continue
        for fname in flist:
            if '.h'==fname[-2:] or '.c'==fname[-2:] or \
               '.hh'==fname[-3:] or '.cpp'==fname[-4:] \
               or '.cu'==fname[-3:]:
                fullname = os.path.join(dirr, fname)
                rmgpl(fullname)
            
            

if __name__ == '__main__':
    import sys
    if(len(sys.argv) > 1):
        rmgpl(sys.argv[1])
    else:
        recurse()

