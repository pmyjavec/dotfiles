syntax on
set list
set t_Co=256
colorscheme vividchalk
set ts=2
set expandtab
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

map g i<CR><Esc>h

Bundle 'gmarik/vundle'
Bundle 'sukima/xmledit'
Bundle 'vim-ruby/vim-ruby'

filetype plugin indent on
