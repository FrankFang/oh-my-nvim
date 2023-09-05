local g, fn, keymap = vim.g, vim.fn, vim.keymap
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


g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.encoding = 'UTF-8'
g.fileencoding = 'utf-8'
g.mapleader = ' '
