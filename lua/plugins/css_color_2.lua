local m = {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    require('nvim-highlight-colors').setup {
      render = 'first_column',
      enable_tailwind = true
    }
  end
}
return {}
