return {
  'simrat39/symbols-outline.nvim',
  config = function()
    require("symbols-outline").setup {
      autofold_depth = 2,
      auto_preview = true,
    }
  end
}
