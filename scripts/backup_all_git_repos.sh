#!/usr/bin/env bash
# will iterate over all directories in the current dir
# then:
# 1 create a mirror repo
# 2 bzip2 it
# 3 delete mirror dir from step 1
for d in */; do 
    git clone --mirror ${d%/} backup.${d%/} && {
        tar cjf backup.${d%/}.tar.bz2 backup.${d%/} && {
            rm -fr backup.${d%/};
        } || {
            echo "Couldn't bzip: ${d%/}";
        }
    } || {
        echo "Couldn't mirror repo: ${d%/}";
    }
done;
