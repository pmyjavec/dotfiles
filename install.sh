#!/bin/bash
# Sets up everything the way I like it...

cd `dirname $0`
echo `pwd`

echo Updating RC files...
git pull

echo "Install files...existing files will be moved to /tmp"
for i in `ls .`; do
  if [ "$i" != "install.sh" ]
   then
    mv -v ~/.$i /tmp/$i.bak
    ln -vs `pwd`/$i ~/.$i
  fi
done

echo "Installing/updating Vundle"
which git 1>&2> /dev/null && (if [ ! -d ~/.vim/bundle ] ; then git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle; fi )\
        || (echo Install Git first...; exit 1)

