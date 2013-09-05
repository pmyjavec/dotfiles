" Vundle manages plug-ins 
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

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
Bundle 'kchmck/vim-coffee-script'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
" Careful, this was screwing up vim at one point
" Bundle 'pgr0ss/vimux-ruby-test' 

set encoding=utf-8
set hlsearch
set t_Co=256
set shiftwidth=2
set expandtab
set background=dark
set history=100         " Restore 111 things from viminfo
set autoindent
set shiftround
set viminfo=\"4,'4,/100,:100,h,f0
set laststatus=2

autocmd FileType c,cpp,python,ruby,java,markdown set textwidth=80 autoindent wrap cc=80

" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
set completeopt=menuone,longest,preview
let g:SuperTabDefaultCompletionType = "context"
"Highlight as error when chars go past column 80
autocmd FileType python highlight OverLength ctermbg=red ctermfg=white
autocmd FileType python match OverLength /\%100v.*/
autocmd FileType python set expandtab tabstop=4 shiftwidth=4 softtabstop=4

"  Ruby
autocmd FileType ruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby highlight OverLength ctermbg=red ctermfg=white

" Used by Lusty Explorer
set hidden

" Leader key is best when most accessible :)
let mapleader=';'
let g:EasyMotion_leader_key = '<Leader><Leader>'

map <Leader>m :VimuxPromptCommand<CR>
map <Leader>a :RunAllRubyTests<CR>
map <Leader>c :VimuxCloseRunner<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>i :set list!<CR>
map <Leader>w :w<CR>
map <Leader>s :SyntasticCheck<CR>
map <Leader>b :TagbarToggle<CR>

if &t_Co > 2 || has("gui_running")
  syntax on
endif

if has("autocmd")
    filetype plugin indent on
  endif

" solarized options 
let g:solarized_termcolors = 256
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1

" Set my color scheme
colorscheme solarized

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.gem$']

" Stops conflicts with the Ack.vim plugin's quickfix window
" let g:pyflakes_use_quickfix = 0

set wildignore=*.o,*~,*.pyc,.gems/*

" Remove trailing white space on save for the following filetypes
autocmd FileType c,cpp,python,ruby,java,puppet autocmd BufWritePre <buffer> :%s/\s\+$//e

"Vim ruby tests
let g:vimux_ruby_cmd_unit_test = "nocorrect bundle exec rspec"
let g:vimux_ruby_cmd_all_tests = "nocorrect bundle exec rspec"
let g:vimux_ruby_cmd_context = "nocorrect bundle exec rspec"

" Syntastic options
"let g:syntastic_python_checkers=['/usr/local/share/python/flake8']
imap '' <esc>a<Plug>snipMateNextOrTrigger
smap '' <Plug>snipMateNextOrTrigger

"YCM Options
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Display punctuation marks for cleaner code
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
