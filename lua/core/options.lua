local opt, cmd, g, keymap = vim.opt, vim.cmd, vim.g, vim.keymap
local cache_dir = vim.fn.stdpath('cache')
local path_join = require('core.helper').path_join


opt.termguicolors = true
opt.hidden = true
opt.magic = true
opt.virtualedit = 'block'
-- opt.clipboard:append { 'unnamed' }
opt.wildignorecase = true
opt.swapfile = false
opt.directory = path_join(cache_dir, 'swap/')
opt.undodir = path_join(cache_dir, 'undo/')
opt.backupdir = path_join(cache_dir, 'backup/')
opt.viewdir = path_join(cache_dir, 'view/')
opt.spellfile = path_join(cache_dir, 'spell', 'en.uft-8.add')
opt.history = 2000
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true

if vim.fn.executable('rg') == 1 then
  opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
  opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
end

opt.completeopt = 'menu,menuone,noselect'
opt.showmode = false
opt.shortmess = 'aoOTIcF'
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.ruler = false
opt.showtabline = 2
opt.winwidth = 30
opt.pumheight = 15
opt.showcmd = false
opt.cursorline = true

opt.cmdheight = 0
opt.laststatus = 2
opt.list = true
opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
opt.pumblend = 10
opt.winblend = 10
opt.undofile = true

opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2

-- wrap
opt.linebreak = true
opt.whichwrap = 'h,l,<,>,[,],~'
opt.breakindentopt = 'shift:2,min:20'
opt.showbreak = '↳ '
opt.wrap = false

opt.foldlevelstart = 99
opt.foldmethod = 'manual'

opt.number = true
opt.signcolumn = 'yes'
opt.spelloptions = 'camel'

-- ruler
opt.textwidth = 120
--opt.colorcolumn = '120'

-- mouse
opt.mouse = 'a'
-- cmd([[
--   autocmd BufEnter zsh set mouse=a
--   autocmd BufLeave zsh set mouse=a
-- ]])

-- search
opt.incsearch = false
