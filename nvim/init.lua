-- I use a console font of "MesloLGS NF" for clink-flex-prompt and it was
-- also required for Gitsigns to work.

-------- Original vim config
vim.cmd([[source C:/Users/JonNewton/AppData/Local/nvim/_vimrc]])
vim.g.python3_host_prog = "C:/Users/JonNewton/AppData/Local/Programs/Python/Python311/python3.exe"


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

--  {
--    'mfussenegger/nvim-dap'
--  },
--
--  {
--    'mxsdev/nvim-dap-vscode-js'
--  },
--
--  {
--    'rcarriga/nvim-dap-ui',
--    dependencies = {
--      'mfussenegger/nvim-dap',
--      'nvim-neotest/nvim-nio'
--    }
--  },
--
--  {
--      "ThePrimeagen/harpoon",
--      branch = "harpoon2",
--      dependencies = { "nvim-lua/plenary.nvim" }
--  }

}, {})

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
--vim.g.markdown_fenced_languages = {
--  "ts=typescript"
--}
--require('lspconfig').denols.setup({})

require('lspconfig').tsserver.setup({})

require('lspconfig').rust_analyzer.setup({})

require('lspconfig').gopls.setup({})

require('lspconfig').gopls.setup({})


-- require("dap-vscode-js").setup({
--   debugger_path = "C:/tools/vscode-js-debug",
--   adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' },
-- })
-- 
-- local js_based_langauges = { "typescript", "javascript" }
-- for _, language in ipairs(js_based_langauges) do
--   require("dap").configurations[language] = {
--     {
--       type = "pwa-node",
--       request = "launch",
--       name = "Launch file",
--       program = "${file}",
--       cwd = "${workspaceFolder}",
--     }
--   }
-- end
-- 
-- require("dapui").setup({})
-- 
-- local dap, dapui = require("dap"), require("dapui")
-- 
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open({})
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close({})
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close({})
-- end
-- 
-- -------- Harpoon config
-- local harpoon = require("harpoon")
-- harpoon:setup({})

-------- Key mappings

-- From primeagen
-- center page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<space>p", [["_dP]])

-- center next/prev search match?
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Trouble config, to show LSP and other messages.
-- vim.keymap.set("n", "<leader>t", function() require("trouble").toggle() end)

-- Debugger
-- vim.keymap.set('n', '<leader>d', require 'dapui'.toggle)
-- vim.keymap.set('n', '<F5>', require 'dap'.continue)
-- vim.keymap.set('n', '<F10>', require 'dap'.step_over)
-- vim.keymap.set('n', '<F11>', require 'dap'.step_into)
-- vim.keymap.set('n', '<F12>', require 'dap'.step_out)
-- vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
-- vim.keymap.set('n', '<leader>B', function()
--   require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
-- end)

-- Harpoon
-- doesn't quite work right...
-- vim.keymap.set("n", "<space>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<space>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set("n", "<space>1", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<space>2", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<space>3", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<space>4", function() harpoon:list():select(4) end)
-- vim.keymap.set("n", "<space>[", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<space>]", function() harpoon:list():next() end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
