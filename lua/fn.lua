local m = {}

local function format_and_save()
  vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
  -- save all
  vim.cmd [[wa]]
end
m.format_and_save = format_and_save


return m
