let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " https://github.com/chriskempson/base16-vim/issues/69
call plug#begin() " Evaluating `nvim` so share plugins with VIM

" Adapted from https://github.com/hrsh7th/nvim-cmp
" Setup LSP servers and auto-completion
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'kyazdani42/nvim-web-devicons'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Misc
Plug 'psf/black'
Plug 'editorconfig/editorconfig-vim'                                        " Consistent configuration per project.
Plug 'ryanoasis/vim-devicons'                                               " Make vim pretty!
Plug 'Yggdroot/indentLine'                                                  " Show indent guides
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
Plug 'mhinz/vim-startify'

Plug 'MunifTanjim/nui.nvim'

Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'Raimondi/delimitMate'
Plug 'benmills/vimux'
Plug 'janko/vim-test'                                                       " Execute tests from vim

Plug 'ellisonleao/gruvbox.nvim'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

Plug 'tpope/vim-commentary'                                                 " Vim-commentary

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end() " vim-plug

set completeopt=menu,menuone,noselect

set background=light" or light if you want light mode
colorscheme gruvbox


lua <<EOF
  require('lualine').setup()

  local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(
         function(fallback)
           cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
         end,
         { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
       ),
       ["<S-Tab>"] = cmp.mapping(
         function(fallback)
           cmp_ultisnips_mappings.jump_backwards(fallback)
         end,
         { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
       ),

    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }

  require("mason").setup()
  require("mason-lspconfig").setup()
  require("mason-lspconfig").setup_handlers {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
      end,
      -- Next, you can provide targeted overrides for specific servers.
      -- For example, a handler override for the `rust_analyzer`:
      ["rust_analyzer"] = function ()
          require("rust-tools").setup {}
      end
  }
EOF

" Turn on filetype plugin and indent loading so that loading the
" vim-misc stuff below loads the proper files.
filetype plugin on
filetype plugin indent on


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
set expandtab      " Insert the right number of spaces
set tabstop=4      " Display n spaces for each tab
set softtabstop=4  " Display n spaces for each softtab
set shiftwidth=4   " Amount of spaces when re-indenting
set colorcolumn=80 " Highlight long lines
set nospell        " Turn off as it conflicts with https://github.com/kamykn/spelunker.vim

" Search  settings
set ignorecase " Ignore casing of searches
set smartcase  " Be smart about case sensitivity when searching

"=============================================================================
" Auto Commands
"=============================================================================
autocmd BufWritePre * :%s/\s\+$//e  "Remove trailing whitespaces

au BufRead,BufNewFile */ansible/*.yaml set filetype=yaml.ansible softtabstop=2 tabstop=2

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

map <Leader>n :NeoTreeShowToggle<CR>
map <Leader>m :NeoTreeFocus<CR>
map <Leader>i :IndentLinesToggle<CR>
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

" Fugitive
map <Leader>gw :Gwrite<CR>

map <Leader>f :Black<CR>

" vim-test
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ts :TestSuite<CR>
map <Leader>tl :TestLast<CR>
map <Leader>tv :TestVisit<CR>

" Make navigating panes easier.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"=============================================================================
" Plugin Settings
"=============================================================================

let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python3'
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python3'
let $PATH.= ':/home/pmyjavec/.pyenv/versions/neovim3/bin/'

" NERDTree
 let NERDTreeIgnore=['\.pyc$', '\.gem$', '\.out', '\~$', '_site', '\.beam$', '__pycache__']


" base16 themes
set termguicolors
set background=light

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" Syntastic
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_ansible_ansible_lint_exec = '/home/pmyjavec/.pyenv/bin/ansible_lint'
let g:syntastic_ansible_checkers = ['ansible_lint']

" ansible
let g:ansible_unindent_after_newline = 0

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

set visualbell             " Flash screen on notifications
set scrolloff=999          " Centered cursor
set ruler                  " Show the line numbers
set number                 " Set line numbers on
set cursorline             " Highlight line the cursor is on
