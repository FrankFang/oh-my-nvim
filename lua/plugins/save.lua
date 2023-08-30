local m = {
  'zoriya/auto-save.nvim',
  config = function()
    require("auto-save").setup {
      debounce_delay = 1000,
      enabled = false,
      trigger_events = { "FocusLost" },
      callbacks = {
        before_saving = function()
          vim.lsp.buf.format()
        end
      }
    }
  end
}
return {}
