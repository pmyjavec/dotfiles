#!/bin/bash
git pull
for i in `ls .`; do 
  if [ "$i" != "install.sh" ] 
   then
    mv -v ~/.$i /tmp/
    ln -vs `pwd`/$i ~/.$i
  fi 
done
