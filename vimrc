let g:plugin_home="~/.vim/plugged"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " https://github.com/chriskempson/base16-vim/issues/69
call plug#begin(expand(g:plugin_home)) " Evaluating `nvim` so share plugins with VIM

" Language Plugins
Plug 'https://github.com/chase/vim-ansible-yaml.git'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'hashivim/vim-terraform'
Plug 'LnL7/vim-nix'
Plug 'psf/black'

" Misc
Plug 'editorconfig/editorconfig-vim'                                        " Consistent configuration per project.
Plug 'ryanoasis/vim-devicons'                                               " Make vim pretty!
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'                                                  " Show indent guides
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'tag': '5.2' } " Automatically complete
Plug 'tpope/vim-fugitive'                                                   " Interact with Git from inside Vim
Plug 'tpope/vim-surround'                                                   " Surround existing text, easily
Plug 'airblade/vim-gitgutter'                                               " Show changes to files in the vim gutter
Plug 'godlygeek/tabular'                                                    " Makes lining up text easier
Plug 'Lokaltog/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'chriskempson/base16-vim'                                              " Themes from base16
Plug 'benmills/vimux'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'itspriddle/vim-shellcheck'
Plug 'janko/vim-test'                                                       " Execute tests from vim
Plug 'iCyMind/NeoSolarized'

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
