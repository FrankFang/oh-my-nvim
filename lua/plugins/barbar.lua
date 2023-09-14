return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
    require 'barbar'.setup {
      auto_hide = true,
      sidebar_filetypes = {
        NvimTree = true,
      }
    }
  end,
}
