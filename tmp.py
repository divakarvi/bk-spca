import os
import re
pwd = os.path.abspath('.')
for path, dlist, flist in os.walk(pwd, topdown=True):
    if dlist.count('.git') > 0:
        dlist.remove('.git')
    if flist.count('Makefile') >= 1:
        fname =  path+'/'+'Makefile'
        fi = open(fname,'r')
        fo = open('tmppp', 'w')
        for l in fi:
            ll = re.sub('####*', '######', l)
            fo.write(ll)
        fo.close()
        fi.close()
        os.system('mv tmppp '+ fname);
os.system('rm tmppp')

