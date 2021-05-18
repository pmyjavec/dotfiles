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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'tag': '6.0' } " Automatically complete
Plug 'tpope/vim-fugitive'                                                   " Interact with Git from inside Vim
Plug 'tpope/vim-surround'                                                   " Surround existing text, easily
Plug 'tpope/vim-rhubarb'                                                    " Open GH links
Plug 'airblade/vim-gitgutter'                                               " Show changes to files in the vim gutter
Plug 'godlygeek/tabular'                                                    " Makes lining up text easier
Plug 'kamykn/spelunker.vim'                                                 " Nicer spell checking
Plug 'kamykn/popup-menu.nvim'                                               " Required for spelunker
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
Plug 'tpope/vim-commentary'                                                 " Vim-commentary
Plug 'jvirtanen/vim-hcl'

" Extra configuration kept in my own Bundle
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

":=============================================================================
" Misc options
"=============================================================================
scriptencoding utf-8
syntax on                 " syntax highlighting for files
set wildmode=list:longest " Wildcard /command matches, order by longest first
set showcmd               " Show current pending command in the prompt

if !has('nvim') " Defaults which nvim already has
    set autoindent                                " Use spaces not tabs by default
    set encoding=utf-8                            " Display specal and foreign charecters
    set autoread                                  " Reload file after begin written to outside of vim
    set backspace=2                               " http://vim.wikia.com/wiki/Backspace_and_delete_problems
    set history=1000                              " Remember commands entered
    set hlsearch                                  " Highlight search results
    set incsearch                                 " Start showing results as you type
    set laststatus=2                              " Show the status bar for all windows
    set listchars=tab:>.,trail:.,extends:#,nbsp:. " Show traiing whitepace etc
endif

" Disable Mouse Support
set mouse=

" Tab settings
set expandtab       " Insert the right number of spaces
set tabstop=4       " Display n spaces for each tab
set softtabstop=4   " Display n spaces for each softtab
set shiftwidth=4    " Amount of spaces when re-indenting
set colorcolumn=80  " Highlight long lines

" Search  settings
set ignorecase " Ignore casing of searches
set smartcase  " Be smart about case sensitivity when searching

"=============================================================================
" Auto Commands
"=============================================================================
autocmd BufWritePre * :%s/\s\+$//e  "Remove trailing whitespaces

"=============================================================================
" Key Bindings
"=============================================================================
"
let mapleader=';' " Easy access to leader key

" Buffer management
nnoremap <silent> [b  :bprevious<CR>
nnoremap <silent> b]  :bnext<CR>
nnoremap <silent> [B  :bfirst<CR>
nnoremap <silent> B]  :blast<CR>
map      <Leader>ls    :ls<CR>

" Tab management
nnoremap <silent> [t  :tabprevious<CR>
nnoremap <silent> t]  :tabnext<CR>
nnoremap <silent> [T  :tabfirst<CR>
nnoremap <silent> T]  :tablast<CR>

" Easy Motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <SPACE> <Plug>(easymotion-s)
nmap <leader>j <Plug>(easymotion-bd-jk)
nmap <leader>k <Plug>(easymotion-bd-jk)
nmap <leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>j <Plug>(easymotion-overwin-line)
nmap <leader><leader>k <Plug>(easymotion-overwin-line)

map <Leader>t :FZF <CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :NERDTreeFocus<CR>
map <Leader>u :IndentGuidesToggle<CR>
map <Leader>s :write<CR>
map <Leader>q :wq<CR>
map <Leader>! :qall<CR>
map <Leader>b :TagbarToggle<CR>
map <Leader>a :Ag!<CR>
map <leader>h :noh<CR>

 " ViMux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

" Moving between splits easier
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fugitive
map <Leader>gw :Gwrite<CR>

" Fugitive
map <Leader>f :Black<CR>

" vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"=============================================================================
" Plugin Settings
"=============================================================================

let g:python3_host_prog = '/home/pmyjavec/.pyenv/versions/neovim3/bin/python3'

" NERDTree
 let NERDTreeIgnore=['\.pyc$', '\.gem$', '\.out', '\~$', '_site', '\.beam$', '__pycache__']

" UltiSnips Configuration
let g:UltiSnipsExpandTrigger="<C-j>"

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1 " Start

" base16 themes
set termguicolors
set background=dark
colorscheme NeoSolarized
let g:neosolarized_contrast = "normal"

" airline
let g:airline_powerline_fonts = 1

" FZF + Silver Searcher
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" vim-terraform
let g:terraform_fmt_on_save = 1

" Black
autocmd BufWritePre *.py execute ':Black'

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" Syntastic
let g:syntastic_python_checkers = ['pylint']

" Vim Gutter
let signcolumn="yes:3"
let g:gitgutter_override_sign_column_highlight = 0
highlight LineNr guibg=none
set updatetime=400

"Misc
set smartcase

"=============================================================================
" Display & theme settings
"=============================================================================

"set t_Co=256               " Use 256 colors
set visualbell             " Flash screen on notifications
set scrolloff=999          " Centered cursor
set ruler                  " Show the line numbers
set number                 " Set line numbers on
set cursorline             " Highlight line the cursor is on
