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
  --vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
  --  highlight CursorLine guibg=#efccff
  --  highlight CursorLineNr guibg=#efccff
  vim.opt.termguicolors = true
  vim.o.background = 'dark'
  vim.cmd.colorscheme 'monokai'
end
