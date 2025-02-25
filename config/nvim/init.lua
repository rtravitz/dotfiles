vim.g.mapleader = ','
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('core.oceanic-next') -- needs to come before plugins for lualine to get scheme

require('lazy').setup('plugins')

require('core.maps')
require('core.options')
require('core.lsp')
require('core.global')
require('core.autocommands')
