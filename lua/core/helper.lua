local m = {}

local on_windows = vim.loop.os_uname().version:match 'Windows'
local sep = on_windows and '\\' or '/'

local function path_join(...)
  local path_sep = on_windows and '\\' or '/'
  local result = table.concat({ ... }, path_sep)
  return result
end

-- Function to execute a command and capture its output
function exec(command)
  -- Open a pipe to execute the command
  local pipe = io.popen(command)
  -- Read the output from the pipe
  local output = pipe:read("*a")
  -- Close the pipe
  pipe:close()
  -- Return the captured output
  return output
end

function trim(str)
  return str:match("^%s*(.-)%s*$")
end


m.sep = sep
m.path_join = path_join
m.exec = exec
m.trim = trim

return m
