local m = {}

local on_windows = vim.loop.os_uname().version:match 'Windows'
local sep = on_windows and '\\' or '/'

local function path_join(...)
  local path_sep = on_windows and '\\' or '/'
  local result = table.concat({ ... }, path_sep)
  return result
end

m.sep = sep
m.path_join = path_join

return m
