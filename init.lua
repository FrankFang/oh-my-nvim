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
  require 'core.keybinding'

  if g.neovide then
    opt.guifont = "JetBrainsMono Nerd Font:h16"
    opt.linespace = 8
    g.neovide_cursor_vfx_mode = "railgun"
    require 'core.neovide'
  end

  -- custom
  opt.termguicolors = true
  opt.number = false
  opt.background = 'light'
  -- cmd.colorscheme 'catppuccin'
  -- cmd.colorscheme 'sonokai'
  -- cmd.colorscheme 'tokyonight'
  -- cmd.colorscheme 'kanagawa'
  -- cmd.colorscheme 'material-lighter'
  cmd.colorscheme 'tempus_day' -- https://github.com/protesilaos/tempus-themes
  -- https://codeyarns.com/tech/2011-07-29-vim-chart-of-color-names.html#gsc.tab=0
  --   hi Cursor guifg=none guibg=CornflowerBlue
  --   hi Cursorline guifg=none guibg=DodgerBlue4
  --   hi Visual guifg=none guibg=DodgerBlue4
  --   hi MatchParen guifg=none guibg=tomato
  cmd([[
    hi BufferInactive guibg=#464340 guifg=white
    hi BufferInactiveMod guibg=#464340 guifg=tomato
    hi BufferInactiveSign guibg=bg guifg=bg
    hi BufferCurrent guibg=bg guifg=#464340
    hi BufferCurrentMod guibg=bg guifg=tomato
    hi BufferCurrentSign guibg=bg guifg=bg
    hi BufferCurrentSignright guibg=bg
  ]])

  -- format before saving
  vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format before saving",
    group = vim.api.nvim_create_augroup("Custom", { clear = true }),
    callback = function()
      vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
    end,
  })

  -- remember last edit position
  -- vim.cmd [[
  --   autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  -- ]]
end
