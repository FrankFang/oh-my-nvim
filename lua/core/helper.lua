local m = {}

local on_windows = vim.loop.os_uname().version:match 'Windows'
local sep = on_windows and '\\' or '/'

local function path_join(...)
  local path_sep = on_windows and '\\' or '/'
  local result = table.concat({ ... }, path_sep)
  return result
end

-- Function to execute a command and capture its output
local function exec(command)
  -- Open a pipe to execute the command
  local pipe = io.popen(command)
  -- Read the output from the pipe
  local output = pipe:read("*a")
  -- Close the pipe
  pipe:close()
  -- Return the captured output
  return output
end

local function trim(str)
  return str:match("^%s*(.-)%s*$")
end

local function merge(...)
  local mergedTable = {}
  for _, tableToMerge in ipairs({ ... }) do
    for key, value in pairs(tableToMerge) do
      mergedTable[key] = value
    end
  end

  return mergedTable
end


local insert_mode_map = function(bindings, options)
  local wk = require("which-key")
  options = merge({ mode = 'i', noremap = true, slient = true }, options or {})
  wk.register(bindings, options)
end

local normal_mode_map = function(bindings, options)
  local wk = require("which-key")
  options = merge({ mode = 'n', noremap = true, slient = true }, options or {})
  wk.register(bindings, options)
end

local insert_and_normal_mode_map = function(bindings, options)
  local wk = require("which-key")
  local insert_options = merge({ noremap = true, slient = true }, options or {}, { mode = 'i' })
  local normal_options = merge({ noremap = true, slient = true }, options or {}, { mode = 'n' })
  -- travel the bindings
  for key, value in pairs(bindings) do
    if type(value[0]) == 'string' then
      wk.register({ [key] = { '<c-o>' .. value[0], value[1] } }, insert_options)
    else
      wk.register({ [key] = value }, insert_options)
    end
    wk.register({ [key] = value }, normal_options)
  end
end

m.sep = sep
m.path_join = path_join
m.exec = exec
m.trim = trim
m.merge = merge
m.insert_mode_map = insert_mode_map
m.normal_mode_map = normal_mode_map
m.insert_and_normal_mode_map = insert_and_normal_mode_map

return m
