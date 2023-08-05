local helper = require('core.helper')
local sep, path_join = helper.sep, helper.path_join
local plugins_path = path_join(vim.fn.stdpath('config') , 'lua', 'plugins')
local colorschemes_path = path_join(vim.fn.stdpath('config') , 'lua', 'colorschemes')

local modules = {}

local collect = function(kind, path)
  local dir_handle = vim.loop.fs_scandir(path)

  while true do
    local item, _ = vim.loop.fs_scandir_next(dir_handle)
    if not item then break end
    _ = item
    item = item:match('(.+)%.lua$')
    if not item then goto continue end
    if item:match('init') then
      goto continue
    end
    local m = require(kind .. '.' .. item)
    if type(m) == "boolean" then
      goto continue
    end
    if (m) then table.insert(modules, m) end
    ::continue::
  end
end

collect('plugins', plugins_path)
collect('colorschemes', colorschemes_path)

require("lazy").setup(modules)

