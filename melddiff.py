#!/usr/bin/python

import sys
import os

################################################################################
# this handy script was written by Nathan Hoad
# http://nathanhoad.net/how-to-meld-for-git-diffs-in-ubuntu-hardy
#
# it allows to use MELD as a GIT diff tool
#
# to configure GIT to use it, simply type:
# git config --global diff.external ~/git/bash-that-vim/melddiff.py
#
# then to use Meld as a diff tool:
# git diff filename
################################################################################

os.system('meld "%s" "%s"' % (sys.argv[2], sys.argv[5]))
