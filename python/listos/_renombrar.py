
#old_file = os.path.join(dir, 'A.HTM')
#new_file = os.path.join(dir, 'a.json')
#os.rename(old_file, new_file)

import glob, os, shutil, os, errno, sys
import subprocess
from glob import glob
from os import getcwd
from os.path import join
from os.path import basename
from subprocess import call

camino = os.getcwd()
listado = glob(join(camino,'*.htm'))

for archivo in listado:
    tmp = os.path.split(archivo)
    path = tmp[0]
    fil = os.path.splitext(archivo)[0]
    extension = os.path.splitext(archivo)[1]

    old_file = archivo
    new_file = fil+'.json'
    
    try:
        #print (old_file)
        #print (new_file)
        os.rename(old_file, new_file)
        #os.chdir(path)

    except OSError as e:
        if e.errno == errno.ENOTDIR:
             print ('error')
        else:
             print ('Error: %s' % e)