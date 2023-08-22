local g, fn = vim.g, vim.fn
if g.vscode then
  -- VSCode extension
  vim.cmd [[source $HOME/.config/nvim/vscode/settings.vim]]
else
  -- ordinary Neovim
  require 'core.prepare'
  require 'core.options'
  require 'core.plugins'

  -- custom
  vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
  vim.cmd.colorscheme "gruvbox"
  vim.cmd([[
    highlight CursorLine guibg=#ffb0b3
    highlight CursorLineNr guibg=#ffb0b3
  ]])
end
