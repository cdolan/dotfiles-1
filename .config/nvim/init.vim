"#####################"
"###### PLUGINS ######"
"#####################"

" Automatic vim-plug installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
"	Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim'

" Initialize plugin system
call plug#end()

"#############################"
"###### GENERAL CONFIGS ######"
"#############################"

" Enter the current millenium
set nocompatible

" Enable syntax and plugins (foindustrial
syntax enable
filetype plugin on
filetype indent on

" Set encoding
set encoding=utf8

" Set colors
set termguicolors

" When a file has been changed outside of Vim, automatically read it again
set autoread

" Always show current position
set ruler

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Tenths of a second to show the matching paren
set mat=2

" Switching this option off most likely breaks plugins!
set magic

" Highlight search results
set hlsearch

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

" Prevent cursor to jump around too much on scroll
set lazyredraw

" Update time in ms
set updatetime=500

" Sets unix as standard filetype
set ffs=unix,dos,mac

" Wrap lines
set wrap

" Maximum items in completion suggest popup menu
set pumheight=10

" Don't make a any backups before overwriting a file
set nobackup
set nowritebackup

" Don't use a swapfile for the buffer
set noswapfile

" Increase max memory to show syntax highlighting for large files
set maxmempattern=20000

"###########################"
"###### FINDING FILES ######"
"###########################"

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Exclude node_modules when using e.g. :find
set wildignore+=**/node_modules/**

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

"#########################"
"###### TAG JUMPING ######"
"#########################"

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags .

set tags=./tags,tags

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

"############################"
"###### AUTOCMDS, ETC ###	###"
"############################"

" Auto resize panes
autocmd VimResized * wincmd =

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Open NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"#####################################"
"###### THEME & PLUGIN SETTINGS ######"
"#####################################"

" Set colors to gui
set termguicolors

" Set theme
" let fehawencolor="padawan"
" colorscheme fehawen
colorscheme industrial

" Set list characters
set list
set lcs=tab:❯\ ,trail:•

" Remove vertical sign (error) column bg
" NOTE: Place after colorscheme to prevent override
highlight clear SignColumn

" Enable deoplete on startup (async completion framework)
let g:deoplete#enable_at_startup = 1

" Custom signs for ALE
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 0

"#########################"
"###### KEYBINDINGS ######"
"#########################"

" Show highligh group in status line (comment out to disable)
" function! SyntaxItem()
" return synIDattr(synID(line("."),col("."),1),"name")
" endfunction
" set statusline=%{SyntaxItem()}

" Tab to complete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Map nerdtreetoggle to ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Map '§' to act as 'Esc' since the MacBook touchbar is... well, crap
map § <Esc>
map! § <C-c>

" Map 'Tab' in normal mode to clear search highlight
map <Tab> :noh<CR>

" Disable arrow keys, coz I needs to learn
map <Up> <Nop>
map! <Up> <Nop>
map <Down> <Nop>
map! <Down> <Nop>
map <Left> <Nop>
map! <Left> <Nop>
map <Right> <Nop>
map! <Right> <Nop>
