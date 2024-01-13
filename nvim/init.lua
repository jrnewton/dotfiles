-- I use a console font of "MesloLGS NF" for clink-flex-prompt and it was
-- also required for Gitsigns to work.

-------- Original vim config
vim.cmd([[source C:/Users/JonNewton/AppData/Local/nvim/_vimrc]])
vim.g.python3_host_prog = "C:/Users/JonNewton/AppData/Local/Programs/Python/Python311/python3.exe"

-------- From primeagen
-- center page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<space>p", [["_dP]])

-- center next/prev search match?
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-------- Random stuff
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-------- Lazy vim plugins
-- auto install lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    "folke/trouble.nvim",
    opts = {
      icons = false
    }
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      {
        'hrsh7th/nvim-cmp',
        dependencies =
        { 'L3MON4D3/LuaSnip' }
      },
    }
  },

  --  { "folke/tokyonight.nvim" },
  --   { "ramojus/mellifluous.nvim", name = "mellifluous", priority = 1000 },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      }
    },
  },

}, {})

-------- Color scheme
--require("mellifluous").setup(
--  {
--    color_set = 'mellifluous',
--    mellifluous = {
--      color_overrides = {
--        dark = {
--          -- hl.set('IncSearch', { bg = colors.other_keywords, fg = colors.bg }) -- 'incsearch' highlighting; also used for the text replaced with ':s///c'
--          -- Also controls highlight yank feature
--          -- other_keywords = '#772828', -- '#2a2d15',
--
--          -- hl.set('Search', { bg = colors.bg4, fg = colors.fg }) -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
--          bg4 = '#772828', --82a2d15',
--        }
--      },
--      neutral = true,
--      bg_contrast = 'hard'
--    }
--  })
--vim.cmd.colorscheme "mellifluous"

-- require("tokyonight").setup({})
-- vim.cmd.colorscheme "tokyonight"

vim.cmd.colorscheme "habamax"

-------- Language server config
local lsp_zero = require("lsp-zero")

-- only enable keymaps when lsp is active for buffer
lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({
    buffer = bufnr,
    -- overwrite existing mappings
    preserve_mappings = false
  })
end)

require('lspconfig').lua_ls.setup({})

require('lspconfig').powershell_es.setup({
  bundle_path = 'C:/tools/lsp/PowerShellEditorServices',
  shell = 'powershell.exe'
})

-- deno LSP configuration
-- To appropriately highlight codefences returned from denols, you will need to augment vim.g.markdown_fenced languages in your init.lua
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
require('lspconfig').denols.setup({})

require('lspconfig').rust_analyzer.setup({})

require('lspconfig').gopls.setup({})

require('lspconfig').gopls.setup({})

-------- Trouble config, to show LSP and other messages.
vim.keymap.set("n", "<leader>t", function() require("trouble").toggle() end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
