return {
  "L3MON4D3/LuaSnip",
  version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_vscode").load {}
  end
}
