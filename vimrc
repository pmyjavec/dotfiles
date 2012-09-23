" Install extras first
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'sukima/xmledit'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vividchalk'

call vundle#rc()

" Set basic options
set list
set t_Co=256
set ts=2
set expandtab
syntax on
filetype plugin indent on
colorscheme vividchalk

