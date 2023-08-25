local m = {
  'stevearc/resession.nvim',
  opts = {},
  config = function()
    local resession = require('resession')
    resession.setup {
      autosave = {
        enabled = true,
        -- How often to save (in seconds)
        interval = 10,
        -- Notify when autosaved
        notify = false,
      },
      -- Save and restore these options
      options = {
        "binary",
        "bufhidden",
        "buflisted",
        "cmdheight",
        "diff",
        "filetype",
        "modifiable",
        "previewwindow",
        "readonly",
        "scrollbind",
        "winfixheight",
        "winfixwidth",
      },
    }
    vim.keymap.set('n', '<leader>ss', resession.save_tab)
    vim.keymap.set('n', '<leader>sl', resession.load)
    vim.keymap.set('n', '<leader>sd', resession.delete)
  end
}
return {}
