#!/usr/bin/env bash
for fn in *; do

  case $fn in
      README.md)
          continue;;
      i3)
        mkdir -p ~/.config/
        ln -vs "${PWD}/i3" "$HOME/.config/"
        continue
        ;;
      kitty)
        mkdir -p ~/.config/
        ln -vs "${PWD}/kitty" "$HOME/.config/"
        continue
        ;;
      nvim)
        mkdir -p ~/.config/nvim
        ln -fs ~/.vimrc ~/.config/nvim/init.vim
        ;;
      *)
        target="$HOME/.$fn"
        rm -rf "${target}"
        ln -vs "${PWD}/${fn}" "$target"
        ;;
  esac
done
