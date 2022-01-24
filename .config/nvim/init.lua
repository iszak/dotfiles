vim.fn['plug#begin']()

vim.fn['plug#']('neovim/nvim-lspconfig')

-- Snippets
vim.fn['plug#']('hrsh7th/vim-vsnip')
vim.fn['plug#']('hrsh7th/vim-vsnip-integ')

-- Autocomplete
vim.fn['plug#']('hrsh7th/nvim-cmp')
vim.fn['plug#']('hrsh7th/cmp-nvim-lsp')

-- File Finder
vim.fn['plug#']('nvim-lua/plenary.nvim')
vim.fn['plug#']('nvim-telescope/telescope.nvim')

-- Theme
vim.fn['plug#']('altercation/vim-colors-solarized')

vim.fn['plug#end']()

-- Theme
vim.g.solarized_termcolors = 256
vim.cmd('colorscheme solarized')

vim.api.nvim_set_keymap('n', '<Leader>w', ':write<CR>', {noremap = true})

-- Finder shortcuts
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})

-- Finder
-- TODO: Configure
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {},
  extensions = {}
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


-- Code completion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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

-- Insertion mode completion
vim.opt.completeopt = 'menu,menuone,noselect'

-- Number of spaces to use for each step of (auto)indent.
vim.opt.shiftwidth = 4

-- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.softtabstop = 4

-- Use the appropriate number of spaces to insert a <Tab>
vim.opt.expandtab = true


-- Enable list mode
vim.opt.list = true
-- NOTE: Consider aligning list chars to neovim
vim.opt.listchars = 'tab:>-,trail:.,nbsp:~,extends:>,precedes:<,eol:$'

-- Show start of lines that have been wrapped
vim.opt.showbreak = '↳'

-- Show the line number relative to the line with the cursor in front of each line
vim.opt.relativenumber = true

-- Highlight the text line of the cursor
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'line'

-- Always draw the signcolumn
vim.opt.signcolumn = 'yes'

-- Highlight screen columns
vim.opt.colorcolumn = '80,120'

-- Remove sign column colour
vim.cmd('highlight clear SignColumn')

-- Common typos
vim.cmd(':command WQ wq')
vim.cmd(':command Wq wq')
vim.cmd(':command W w')
vim.cmd(':command Q q')

-- Disable arrow keys in normal, visual, select and operator-pending modes
vim.api.nvim_set_keymap('', '<Up>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('', '<Down>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('', '<Right>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('', '<Up>', '<NOP>', {noremap = true})

-- Disable arrow keys in insert mode
vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', {noremap = true})
vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', {noremap = true})

-- Ignore case in search pattern
vim.opt.ignorecase = true

-- Override ignorecase if search pattern contains upper case characters
vim.opt.smartcase = true

-- Clear search highlight on enter in normal mode
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', {noremap = true})

-- When a bracket is inserted, briefly jump to the matching one.
vim.opt.showmatch = true

-- Tenths of a second to show the matching paren, when 'showmatch' is
vim.opt.matchtime = 100

-- automatically reads/write undo history to an undo file
vim.opt.undofile = true
vim.opt.undolevels = 16364
