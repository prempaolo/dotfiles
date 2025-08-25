--        _
-- __   _(_)_ __ ___  _ __ ___
-- \ \ / / | '_ ` _ \| '__/ __|
--  \ V /| | | | | | | | | (__
--   \_/ |_|_| |_| |_|_|  \___|

-----------------------------------------------------------
-- Leader key
-----------------------------------------------------------
vim.g.mapleader = " "

-----------------------------------------------------------
-- Bootstrap lazy.nvim
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Load plugins from lua/plugins.lua
-----------------------------------------------------------
require("lazy").setup("plugins")

-----------------------------------------------------------
-- General settings
-----------------------------------------------------------
vim.opt.rnu = true
vim.opt.mouse = "a"
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.background = "dark"
vim.cmd.colorscheme("gruvbox")

-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
-- Compile document
vim.keymap.set("n", "<leader>x", ":w! | !compiler %<CR><CR>", { silent = true })
-- Open PDF/HTML
vim.keymap.set("n", "<leader>o", ":!opout %<CR><CR>", { silent = true })

-- Goyo
vim.keymap.set("n", "<leader>f", ":Goyo | set linebreak<CR>", { silent = true })

-- NERDTree
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>", { silent = true })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- EasyMotion
vim.g.EasyMotion_do_mapping = 0
vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-overwin-f)", {})

-- Autoformat
vim.keymap.set("n", "<leader>a", ":Autoformat<CR>", { silent = true })

-- Treesitter
require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "python", "html", "javascript", "markdown" },
  highlight = { enable = true },
  indent = { enable = true },
}

-- Split + telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope smart_open<cr>", { silent = true })
vim.keymap.set("n", "<leader>b", ":split<cr><cmd>Telescope smart_open<cr>", { silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit<cr><cmd>Telescope smart_open<cr>", { silent = true })

-- LSP keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})

-----------------------------------------------------------
-- Highlight settings
-----------------------------------------------------------
vim.cmd [[
  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
]]

-----------------------------------------------------------
-- Split behavior
-----------------------------------------------------------
vim.opt.splitright = true
vim.opt.splitbelow = true

-----------------------------------------------------------
-- Smooth scroll mappings
-----------------------------------------------------------
vim.api.nvim_set_keymap("n", "<c-u>", ":call smooth_scroll#up(&scroll, 10, 2)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-d>", ":call smooth_scroll#down(&scroll, 10, 2)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-b>", ":call smooth_scroll#up(&scroll*2, 10, 4)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-f>", ":call smooth_scroll#down(&scroll*2, 10, 4)<CR>", { silent = true })

-----------------------------------------------------------
-- LSP setup (Pyright, Ruff, HTML)
-----------------------------------------------------------
local lspconfig = require("lspconfig")

lspconfig.pyright.setup {}
lspconfig.ruff.setup {}
lspconfig.html.setup {}

-----------------------------------------------------------
-- Mason setup
-----------------------------------------------------------
require("mason").setup()
