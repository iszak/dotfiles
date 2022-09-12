" [x] syntax highlighting
" [x] code completion
" [x] definition/declaration look up
" [x] documentation look up
" - file search
" - theme
" - terminal?
" - notify?
"
call plug#begin()

Plug 'neovim/nvim-lspconfig'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Auto-complete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" File Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'altercation/vim-colors-solarized'

Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Theme
let g:solarized_termcolors=256
colorscheme solarized


" Finder shortcuts
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
-- Finder
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

-- Autocomplete
local cmp = require'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
}

-- / command line auto-complete
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})


-- : command line and path auto-complete
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- vim.api.nvim_command('autocmd BufWritePre *.{js,jsx,ts,tsx,rs,rb} lua vim.lsp.buf.format(nil, 1000)')

-- Code completion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- TODO: Consider loop
local servers = {
  -- HTML (vscode-html-language-server)
  'html',
   -- CSS (vscode-css-language-server)
  'cssls',
   -- JSON (vscode-json-language-server)
  'jsonls',
   -- JS/TS (typescript-language-server)
  'tsserver',
   -- ESLint (vscode-eslint-language-server)
  'eslint',
  -- Rust (Rust Analyzer)
  'rust_analyzer'
  -- YAML?
}
for _, lsp in ipairs(servers) do
  require'lspconfig'[lsp].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Insertion mode completion
set completeopt=menu,menuone,noselect


lua <<EOF
EOF

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4

" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4

" Use the appropriate number of spaces to insert a <Tab>
set expandtab


" Enable list mode
set list
set listchars=tab:>-,trail:.,nbsp:~,extends:>,precedes:<,eol:$
" NOTE: Consider aligning list chars to neovim
" set listchars=tab:> ,trail:-,nbsp:+

" Show start of lines that have been wrapped
set showbreak=↳

" Load colour scheme
" colorscheme solarized

" Show the line number relative to the line with the cursor in front of each line
set relativenumber

" Highlight the text line of the cursor
set cursorline
set cursorlineopt=line

" Always draw the signcolumn
set signcolumn=yes

" Highlight screen columns
set colorcolumn=80,120

" Remove sign column colour
highlight clear SignColumn

" Common typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Disable arrow keys in normal, visual, select and operator-pending modes
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>

" Disable arrow keys in insert mode
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>

" Ignore case in search pattern
set ignorecase

" Override ignorecase if search pattern contains upper case characters
set smartcase

" Clear search highlight on enter in normal mode
nnoremap <CR> :noh<CR><CR>

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Tenths of a second to show the matching paren, when 'showmatch' is
set matchtime=100

" automatically reads/write undo history to an undo file
set undofile
set undolevels=16364
