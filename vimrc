" Vundle manages plug-ins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Language Plugins
Plugin 'https://github.com/chase/vim-ansible-yaml.git'
Plugin 'fatih/vim-go'
Plugin 'rodjek/vim-puppet'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lrampa/vim-apib'
Plugin 'elzr/vim-json'

" Misc
Plugin 'ctrlpvim/ctrlp.vim.git' " Easily find flies
Plugin 'Yggdroot/indentLine'    " Show indent guides
Plugin 'Valloric/YouCompleteMe' " Automatically complete
Plugin 'tpope/vim-fugitive'     " Interact with Git from inside Vim
Plugin 'airblade/vim-gitgutter' " Show changes to files in the vim gutter
Plugin 'godlygeek/tabular'      " Makes lining up text easier

Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

Plugin 'altercation/vim-colors-solarized'

" Extra configuration kept in my own Bundle
Plugin 'pmyjavec/vim-config'
Plugin 'pmyjavec/vim-ftplugins'

" Turn on filetype plugin and indent loading so that loading the
" vim-misc stuff below loads the proper files.
filetype plugin indent on

let g:PersonalVimConfig = "~/.vim/bundle/vim-config/vimrc.vim"

" Load custom vimrc if it exists
if filereadable(expand(g:PersonalVimConfig))
    execute "source " . g:PersonalVimConfig
endif
