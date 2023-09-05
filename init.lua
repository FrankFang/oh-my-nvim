local g, fn, opt, keymap, cmd = vim.g, vim.fn, vim.opt, vim.keymap, vim.cmd

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

  if g.neovide then
    opt.guifont = "JetBrainsMono Nerd Font:h11"
    opt.linespace = 8
    g.neovide_cursor_vfx_mode = "railgun"
    require 'core.neovide'
  end

  -- custom
  opt.termguicolors = true
  opt.background = 'dark'
  opt.number = false
  cmd.colorscheme 'sonokai'
  -- https://codeyarns.com/tech/2011-07-29-vim-chart-of-color-names.html#gsc.tab=0
  cmd([[
    hi Cursor guifg=none guibg=CornflowerBlue
    hi Cursorline guifg=none guibg=DodgerBlue4
    hi Visual guifg=none guibg=DodgerBlue4
    hi MatchParen guifg=none guibg=tomato
    hi BufferCurrent guibg=DodgerBlue4
    hi BufferCurrentSign guibg=DodgerBlue4
    hi BufferCurrentSignRight guibg=DodgerBlue4
  ]])

  -- Ctrl-S to save all
  vim.api.nvim_set_keymap('i', '<c-s>', '<c-o><cmd>wa<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<c-s>', '<cmd>wa<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'c*', '*<c-o>cgn', { noremap = true, silent = true })

  -- format before saving
  vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format before saving",
    group = vim.api.nvim_create_augroup("Custom", { clear = true }),
    callback = function()
      vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
    end,
  })

  -- remember last edit position
  vim.cmd [[
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  ]]
end
