" Disable VI compatibility mode
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Solarized colour scheme
Plugin 'altercation/vim-colors-solarized'

" Editor Config support
Plugin 'editorconfig/editorconfig-vim'

" Status bar
Plugin 'vim-airline/vim-airline'

" Git Gutter
Plugin 'airblade/vim-gitgutter'


" Always display buffers
let g:airline#extensions#tabline#enabled = 1

" Enable extensions
let g:airline_extensions = ["ale", "branch"]

" Enable ALE integration
let g:airline#extensions#ale#enabled = 1



" Syntax checking and Autocomplete
Plugin 'w0rp/ale'

" Enable tab autocomplete
Plugin 'ervandew/supertab'

" Enable auto-completion
let g:ale_completion_enabled = 1
"let g:ale_completion_delay = 1

" Display brief information about symbols at the cursor
let g:ale_set_balloons = 1 


" Trim white space on save
" TODO
"Plugin 'koryschneider/vim-trim'
"autocmd BufWrite * :call Trim()

" JavaScript
Plugin 'pangloss/vim-javascript'

" JSX
Plugin 'mxw/vim-jsx'


" Rust
Plugin 'rust-lang/rust.vim'

" Ruby
Plugin 'vim-ruby/vim-ruby'

call vundle#end()


" Enable syntax highlighting
syntax on

" Enable filetype detection
filetype on

" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on


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
set showbreak=\\ 
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:~,eol:$


" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Smart case
set smartcase

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

" Fix common typos
:command WQ wq
:command Wq wq
:command W w
:command Q q
