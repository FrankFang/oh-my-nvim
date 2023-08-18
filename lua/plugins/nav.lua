local m = {
  'ray-x/navigator.lua',
  dependencies = {
    { 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
    { 'neovim/nvim-lspconfig' },
  },
  config = function()
    require 'navigator'.setup {}
  end,
}
return {}
