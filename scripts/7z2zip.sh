#!/usr/bin/env bash

for i in *7z
do
  tmpdir=$( basename "${i}" .7z )
  mkdir "${tmpdir}" && pushd "${tmpdir}"
  if 7z x ../"${i}"
  then
     if zip -9 -r ../"${tmpdir}".zip * .[^.]*
     then
        popd
        rm "${i}"
     else
        popd
        echo Packing ${tmpdir}.zip failed!
     fi
  else
     echo Unpacking ${i} failed!
  fi
  rm -rf "${tmpdir}"
done
