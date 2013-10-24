#!/usr/bin/env bash
# A simple script that allows git to use vimdiff as the default diff tool
# watch the vid for more details
# http://www.youtube.com/watch?v=hb5RVnOda2o&hd=1
echo $*
vimdiff "$1" "$2"
