#!/usr/bin/env bash
for fn in *; do
  if [ ! $fn == "i3" -a ! $fn == "README.md" -a ! $fn == "install.sh" -a ! $fn == "Brewfile" ]; then
    target="$HOME/.$fn"
    rm -rf $target
    ln -vs $PWD/$fn $target
  fi
done

# NeoVim + Vim configuration file sharing
mkdir -p ~/.config/nvim
ln -fs ~/.vimrc ~/.config/nvim/init.vim

# i3 config
mkdir -p ~/.config/
ln -vs $PWD/i3 ~/.config/
