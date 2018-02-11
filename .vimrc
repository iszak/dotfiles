set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Solarized colour scheme
Plugin 'altercation/vim-colors-solarized'

" Syntax checking
Plugin 'vim-syntastic/syntastic'

" Autocomplete
Plugin 'valloric/youcompleteme'

" JSX
Plugin 'mxw/vim-jsx'

" Rust
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on


" Theme
" Use dark background
set background=dark

" Use solarized theme
colorscheme solarized

" Show line number
set number

" Highlight current line
set cursorline

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Enable filetype plugins
filetype plugin on

" Enable filetype indentation
filetype indent on


" Show matching brackets
set showmatch

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Tabs / Spaces preference
set shiftwidth=4
set softtabstop=4

" Use spaces instead of tabs
set expandtab
set smarttab

" Auto-indent
set autoindent
" Show invisible characters
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Smart case
set smartcase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Show the cursor position
set ruler

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Enable mouse in all modes
set mouse=a

" Disable backups
set nobackup
set nowb
set noswapfile

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite * :call DeleteTrailingWS()

" Fix common typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Add Syntastic warning message to status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" JSX support for .js files
let g:jsx_ext_required = 0

" Rust format on save
let g:rustfmt_autosave = 1

" Language checks
let g:syntastic_rust_checkers = ['cargo', 'rustfmt']
let g:syntastic_go_checkers = ['go', 'gofmt', 'govet']
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
