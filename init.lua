vim.opt.runtimepath:prepend("~/.config/nvim-based")
-- vim.opt.runtimepath:prepend("/home/michal/.local/share/nvim/site/pack/packer/start/lazygit.nvim")
--
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.number = true -- Optional: show absolute line number on current line

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

require("core.mappings")
require("lazy").setup("plugins") -- assumes plugins are in lua/plugins/init.lua
require("mason")
require("rails")
