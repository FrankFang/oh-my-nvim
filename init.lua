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
  vim.opt.number = false
  vim.cmd.colorscheme 'sonokai'
  -- https://codeyarns.com/tech/2011-07-29-vim-chart-of-color-names.html#gsc.tab=0
  vim.cmd([[
    hi Cursor guifg=none guibg=CornflowerBlue
    hi Cursorline guifg=none guibg=DodgerBlue4
    hi Visual guifg=none guibg=DodgerBlue4
    hi MatchParen guifg=none guibg=tomato
  ]])

  vim.api.nvim_set_keymap('i', '<c-s>', '<cmd>lua require("fn").format_and_save()<cr>', { noremap = true, silent = true })
end
