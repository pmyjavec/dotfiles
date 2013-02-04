
set list
set t_Co=256
set ts=2
set shiftwidth=2
set expandtab
set wrap
set textwidth=80
set background=dark
" Used by Lusty Explorer
set hidden
" Leader key is best when most accessible :)
let mapleader=" "

syntax enable
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-vividchalk.git'
Bundle 'sukima/xmledit'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'sunaku/vim-ruby-minitest'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle 'rodjek/vim-puppet'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mileszs/ack.vim'
Bundle 'jamessan/vim-gnupg'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'benmills/vimux'
Bundle 'emergion/lusty'


filetype plugin indent off
filetype on
filetype plugin on
syntax on
filetype plugin indent on

" solarized options 
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1

" Set my color scheme
colorscheme solarized
