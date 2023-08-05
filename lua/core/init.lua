local g, fn = vim.g, vim.fn
local path_join = require("core.helper").path_join

local cache_dir = vim.fn.stdpath('cache')

local createdir = function()
  local data_dir = {
    path_join(cache_dir, 'backup'),
    path_join(cache_dir, 'session'),
    path_join(cache_dir, 'swap'),
    path_join(cache_dir, 'tags'),
    path_join(cache_dir, 'undo'),
  }
  if fn.isdirectory(cache_dir) == 0 then
    os.execute('mkdir -p ' .. cache_dir)
    for _, v in pairs(data_dir) do
      if fn.isdirectory(v) == 0 then
        os.execute('mkdir -p ' .. v)
      end
    end
  end
end

createdir()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require 'core.options'
require 'core.autoload'
