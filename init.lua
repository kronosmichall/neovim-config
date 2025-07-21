vim.opt.runtimepath:prepend("~/.config/nvim-based")

vim.env.NVIM_LISTEN_ADDRESS = "/tmp/nvimsocket"
vim.g.mapleader = " "
vim.cmd("colorscheme tokyonight-night")
-- vim.opt.runtimepath:prepend("/home/michal/.local/share/nvim/site/pack/packer/start/lazygit.nvim")
--
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.number = true -- Optional: show absolute line number on current line
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.tabstop = 2       -- Number of spaces for a tab

vim.o.ignorecase = true     -- ignore case in search patterns
vim.o.smartcase = true      -- override ignorecase if uppercase letters used

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- fallback clone if needed (in case step 2 was skipped)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins") -- assumes plugins are in lua/plugins/init.lua
require("completion")
require("my_lsp")
require("rails")
require("formatter")
require("core.mappings")

