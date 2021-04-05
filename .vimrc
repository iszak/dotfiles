" Disable VI compatibility mode
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Solarized colour scheme
Plugin 'altercation/vim-colors-solarized'

" Status bar
Plugin 'vim-airline/vim-airline'

" Git Gutter
Plugin 'airblade/vim-gitgutter'

" Enable tab autocomplete
Plugin 'ervandew/supertab'

Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'prabirshrestha/vim-lsp'

Plugin 'kien/ctrlp.vim'

" JavaScript
Plugin 'pangloss/vim-javascript'

" JSX
Plugin 'MaxMEllon/vim-jsx-pretty'

" Rust
Plugin 'rust-lang/rust.vim'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Editor Config support
Plugin 'editorconfig/editorconfig-vim'

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
let g:solarized_termcolors=256

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

" Disable mouse in all modes
set mouse-=a

" Show command being entered
set showcmd

" Set column marker
set colorcolumn=80,120

" Enable undo file
set undofile
set undodir=~/.vim/undo
set undolevels=16384

" Disable backups
set nobackup
set nowritebackup
set noswapfile

" Make a buffer hidden when abandoned
set hidden

" Fix common typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Airline
" Always display buffers
let g:airline#extensions#tabline#enabled = 1

" Enable extensions
let g:airline_extensions = ["branch"]


" Git Gutter
" Reduce update delay
set updatetime=100

" Always show sign column
set signcolumn=yes

" Remove sign column colour
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow


" LSP
let g:lsp_semantic_enabled = 1

let g:lsp_diagnostics_float_cursor = 1

let g:lsp_diagnostics_echo_delay = 0
let g:lsp_diagnostics_highlights_delay = 0
let g:lsp_completion_documentation_delay = 0

setlocal tagfunc=lsp#tagfunc
autocmd! BufWritePre *.rs LspDocumentFormatSync

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'allowlist': ['typescript', 'typescript.tsx', 'typescriptreact', 'javascript', 'javascript.jsx', 'javascriptreact']
      \ })
endif

if executable('html-languageserver')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'html-languageserver',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'allowlist': ['html'],
      \ })
endif

if executable('css-languageserver')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'css-languageserver',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'allowlist': ['css'],
      \ })
endif

if executable('solargraph')
  au User lsp_setup call lsp#register_server({
              \ 'name': 'solargraph',
              \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
              \ 'initialization_options': {"diagnostics": "true"},
              \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
              \ 'allowlist': ['ruby'],
              \ })
endif

if executable('vim-language-server')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'vim-language-server',
                \ 'cmd': {server_info->['vim-language-server', '--stdio']},
                \ 'allowlist': ['vim'],
                \ 'initialization_options': {
                \   'vimruntime': $VIMRUNTIME,
                \   'runtimepath': &rtp,
                \ }})
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'allowlist': ['rust'],
        \ })
endif

nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gD :LspDeclaration<CR>
nnoremap <silent> gs :LspDocumentSymbolSearch<CR>
nnoremap <silent> gS :LspWorkspaceSymbolSearch<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> gi :LspImplementation<CR>
"nnoremap <silent> gt :LspTypeDefinition<CR>
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> <F2> :LspRename<CR>
nnoremap <silent> = :LspDocumentRangeFormat<CR>

" Disabled due to slow performance, see https://github.com/prabirshrestha/vim-lsp/pull/1104
"set foldlevelstart=20
"set foldmethod=expr
"  \ foldexpr=lsp#ui#vim#folding#foldexpr()
"  \ foldtext=lsp#ui#vim#folding#foldtext()
