" Use the Solarized Dark theme
set background=dark
"colorscheme solarized

" Show line number
set number

" Highlight current line
set cursorline

" Use UTF-8 without BOM
set encoding=utf-8 nobomb


" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Tabs / Spaces preference
set shiftwidth=4
set softtabstop=4
set expandtab

" Auto-indent
set autoindent
" Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

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
