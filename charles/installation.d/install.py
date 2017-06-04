#!/usr/bin/python3
import os
from subprocess import call
setting_path  = os.path.split(os.path.abspath(__file__))[0]
setting_dir = ['get.d', 'conf.d']

for dir in setting_dir:
    if input('Install %s ?[y/N]' % dir).lower()[0] == 'y':
        for file in os.listdir(os.path.join(setting_path, dir)):
            if input('Install %s ?[y/N]' % os.path.join(dir, file)).lower()[0] == 'y':
                call(['bash', os.path.join(setting_path, dir, file)])

call(['fish', os.path.join(setting_path, 'omf-restore')])
