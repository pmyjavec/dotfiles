" Vundle manages plug-ins 
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'rodjek/vim-puppet'
Bundle 'sukima/xmledit'
Bundle 'tomtom/tcomment_vim'
Bundle 'sjbach/lusty'
Bundle 'benmills/vimux'
Bundle 'jamessan/vim-gnupg'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'vim-scripts/tlib'
Bundle 'nvie/vim-flake8'
Bundle 'kchmck/vim-coffee-script'

set list
set hlsearch
set t_Co=256
set ts=2
set shiftwidth=2
set expandtab
set wrap
set textwidth=80
set background=dark
set history=100         " Restore 111 things from viminfo
set autoindent
set shiftround
set viminfo=\"4,'4,/100,:100,h,f0

" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview
let g:SuperTabDefaultCompletionType = "context"
"Highlight as error when chars go past column 80
autocmd FileType python highlight OverLength ctermbg=red ctermfg=white
autocmd FileType python match OverLength /\%80v.*/

"  Ruby
autocmd FileType ruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby highlight OverLength ctermbg=red ctermfg=white

" Used by Lusty Explorer
set hidden

" Leader key is best when most accessible :)
let mapleader=';'
let g:EasyMotion_leader_key = '<Leader><Leader>'

map <Leader>m :VimuxPromptCommand<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :VimuxPromptCommand<CR>

if &t_Co > 2 || has("gui_running")
  syntax on
endif

if has("autocmd")
    filetype plugin indent on
  endif

" solarized options 
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized256'

" Set my color scheme
colorscheme solarized

" Cool icons in Powerline status bar
let g:Powerline_symbols = 'fancy'

" NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Stops conflicts with the Ack.vim plugin's quickfix window
let g:pyflakes_use_quickfix = 0

set wildignore=*.o,*~,*.pyc,.gems/*
