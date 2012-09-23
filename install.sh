#!/bin/bash
# Sets up everything the way I like it...

cd `dirname $0`
echo `pwd`

echo "Installing/updating Vundle"
which git 1>&2> /dev/null && (if [ ! -d ~/.vim/bundle ] ; then git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle; fi )\
        || (echo Install Git first...; exit 1)
 
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

# Sets up gem home etc from bash_profile, installs gems
source ~/.bash_profile
echo "Installing my favourite gems..."
which bundle 1>&2> /dev/null && bundle install || echo "Check your ruby env...bundler missing"
echo done
