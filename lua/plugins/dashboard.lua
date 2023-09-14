local m = { 
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      change_to_vcs_root = true
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'} }
}

return {}
