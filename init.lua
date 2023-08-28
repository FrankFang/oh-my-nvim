local g, fn = vim.g, vim.fn

if g.vscode then
  -- VSCode extension
  vim.cmd [[
    source $HOME/.config/nvim/vscode/settings.vim
  ]]
else
  -- ordinary Neovim
  require 'core.prepare'
  require 'core.options'
  require 'core.plugins'

  -- custom
  vim.opt.termguicolors = true
  vim.o.background = 'dark'
  vim.cmd.colorscheme 'monokai'
end
