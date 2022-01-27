" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Installing vim-plug when not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Load plugins with vim-plug
call plug#begin()
   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 
   Plug 'junegunn/vim-easy-align'
   Plug 'fatih/vim-go', { 'for': 'go' }
   Plug 'chrisbra/csv.vim', { 'for': 'csv' }
   Plug 'sainnhe/gruvbox-material'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Leader key
let mapleader = ","

" Security
set modelines=0

" Show relative line numbers
set number relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
set list " To enable by default
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
colorscheme gruvbox-material

" Do not create backup and swap files
set nobackup
set noswapfile

" Remember the last positions in files
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Keymap configurations
" NERDTree operations
nmap <C-n> :NERDTree<cr> " Can also be used to focus on the NERDTree window
nmap <C-t> :NERDTreeToggle<cr> " Can also be used to close NERDTree
nmap tt :tab split<CR> " Open splitted window in a new tab
nmap tc :tab close<CR> " Close the tab/window
nmap <leader>r :so ~/.vimrc<CR> " Reload the vimrc
