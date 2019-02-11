" Automatic vim-plug installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'mattn/emmet-vim'

Plug 'w0rp/ale'

Plug 'leafgarland/typescript-vim'

Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

Plug 'Shougo/deoplete.nvim'

Plug 'jiangmiao/auto-pairs'

" "Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'vim-airline/vim-airline'

Plug 'ekalinin/Dockerfile.vim'

Plug 'hzchirs/vim-material'

" Initialize plugin system
call plug#end()

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Always show current position
set ruler

set cmdheight=2
set noshowmode

" Disable compatibility to old-time vi
set nocompatible

" Show matching brackets.
set showmatch
set mat=2

set magic

" Do case insensitive matching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

set incsearch

" Number of columns occupied by a tab character
set tabstop=2

" See multiple spaces as tabstops so <BS> does the right thing
set softtabstop=2

" Softtabstop == tabstop, noexpandtab && always force use of tabs
set noexpandtab

" Width for autoindents
set shiftwidth=2

" Indent a new line the same amount as the line just typed
set autoindent

" Add line numbers
set relativenumber number

" Get bash-like tab completions
set wildmode=longest,list

" Prevent cursor to jump around too much on scroll
set lazyredraw

" Sets unix as standard filetype
set ffs=unix,dos,mac

" Wrap lines
set wrap

set nocursorcolumn
set nocursorline
set updatetime=300

set pumheight=10

set nobackup
set nowb
set noswapfile

" Increase max memory to show syntax highlighting for large files
set maxmempattern=20000

" Auto resize panes
autocmd VimResized * wincmd =

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Plugin configs
let g:deoplete#enable_at_startup = 1

let g:material_style='palenight'
set background=dark
colorscheme vim-material

let g:airline_theme='material'

let NERDTreeShowHidden=1

" Map nerdtreetoggle to ctrl-n
map <C-n> :NERDTreeToggle<CR>
