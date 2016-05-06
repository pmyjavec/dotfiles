#!/usr/bin/env bash

for fn in *; do
  if [ ! $fn == "README.md" -a ! $fn == "install.sh" -a ! $fn == "Brewfile" ]; then

    target="$HOME/.$fn"

    rm -rf $target

    ln -vs $PWD/$fn $target

  fi
done
