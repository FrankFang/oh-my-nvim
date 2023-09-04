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

  -- Ctrl-S to save all
  vim.api.nvim_set_keymap('i', '<c-s>', '<c-o><cmd>wa<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<c-s>', '<cmd>wa<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'c*', '*<c-o>cgn', { noremap = true, silent = true })

  vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format before saving",
    group = vim.api.nvim_create_augroup("Custom", { clear = true }),
    callback = function()
      vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
    end,
  })

  vim.cmd [[
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  ]]
end
