let g:plugin_home="~/.vim/plugged"
call plug#begin(expand(g:plugin_home)) " Evaluating `nvim` so share plugins with VIM

" Language Plugins
Plug 'https://github.com/chase/vim-ansible-yaml.git'
Plug 'fatih/vim-go'
Plug 'rodjek/vim-puppet'
Plug 'kchmck/vim-coffee-script'
Plug 'lrampa/vim-apib'
Plug 'elzr/vim-json'
Plug 'elixir-lang/vim-elixir'

" Misc
Plug 'junegunn/fzf' " fuzzy finder, brew install fzf to get working
Plug 'Yggdroot/indentLine'    " Show indent guides
Plug 'Shougo/deoplete.nvim'   " Automatically complete
Plug 'tpope/vim-fugitive'     " Interact with Git from inside Vim
Plug 'airblade/vim-gitgutter' " Show changes to files in the vim gutter
Plug 'godlygeek/tabular'      " Makes lining up text easier
Plug 'Lokaltog/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'chriskempson/base16-vim' "Themes from base16

" Extra configuration kept in my own Bundle
Plug 'pmyjavec/vim-config'
Plug 'pmyjavec/vim-ftplugins'

call plug#end() " vim-plug

" Turn on filetype plugin and indent loading so that loading the
" vim-misc stuff below loads the proper files.
filetype plugin indent on


" Load custom vimrc if it exists
let g:vim_config_path = expand(plugin_home . "/vim-config/vimrc.vim")

if filereadable(g:vim_config_path)
    execute "source " . g:vim_config_path
endif
