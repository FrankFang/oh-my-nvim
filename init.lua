if vim.g.vscode then
  -- VSCode extension
  vim.cmd [[source $HOME/.config/nvim/vscode/settings.vim]]
else
  -- ordinary Neovim
  require 'core.prepare'
  require 'core.options'
  require 'core.plugins'
end
