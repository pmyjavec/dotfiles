set nocompatible               " be iMproved
set list
set t_Co=256
set ts=2
set expandtab
syntax on
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-vividchalk.git'
Bundle 'sukima/xmledit'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-ruby/vim-ruby'
" vim-scripts repos
" non github repos
" ...

filetype plugin indent off
filetype on
syntax on
colorscheme vividchalk
