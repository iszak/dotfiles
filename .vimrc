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

" ALE go to definition
"nnoremap gd :ALEGoToDefinition<cr>

" Syntax checking, Linters, Fixers and Autocomplete
Plugin 'w0rp/ale'

" Enable tab autocomplete
Plugin 'ervandew/supertab'

" Enable auto-completion
let g:ale_completion_enabled = 0

" Only run linters specified
let g:ale_linters_explicit = 1

let b:ale_linters = {
  \"go": ["gobuild", "gofmt", "golangserver"],
  \"javascript": ["eslint", "tsserver"],
  \"ruby": ["rubocop", "ruby", "solargraph"],
  \"rust": ["cargo", "rls", "rustc"]
\}

let b:ale_fixers = {
  \"*": ["remove_trailing_lines", "trim_whitespace"],
  \"go": ["gomod", "goimports"],
  \"javascript": ["prettier", "eslint"]
\}

let g:ale_fix_on_save = 1


" Always sure sign gutter
let g:ale_sign_column_always = 1

Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'ryanolsonx/vim-lsp-javascript'

if executable('javascript-typescript-stdio')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'javascript support using typescript-language-server',
    \ 'cmd': { server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
    \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
    \ 'whitelist': ['javascript', 'javascript.jsx']
    \ })
endif

if executable('html-languageserver')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'html-languageserver',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['html'],
      \ })
endif


if executable('css-languageserver')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'css-languageserver',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['css'],
      \ })
endif

if executable('solargraph')
  au User lsp_setup call lsp#register_server({
              \ 'name': 'solargraph',
              \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
              \ 'initialization_options': {"diagnostics": "true"},
              \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
              \ 'whitelist': ['ruby'],
              \ })
endif

nnoremap gd :LspDeclaration<cr>


" JavaScript
Plugin 'pangloss/vim-javascript'

" JSX
Plugin 'MaxMEllon/vim-jsx-pretty'

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

" Show command being entered
set showcmd

" Set column marker
set colorcolumn=80,120

" Disable backups
set nobackup
set nowb
set noswapfile

" Fix common typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Reset go omnifunc
" TODO: Move to ftplugin file
" autocmd FileType go setlocal omnifunc=
autocmd FileType go setlocal softtabstop=8
autocmd FileType go setlocal shiftwidth=8
autocmd FileType go nnoremap gd :GoDef<cr>
