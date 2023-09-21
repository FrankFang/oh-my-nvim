local g, fn, opt, keymap = vim.g, vim.fn, vim.opt, vim.keymap
g.neovide_input_macos_alt_is_meta = true
g.neovide_confirm_quit = true
g.neovide_scroll_animation_length = 0
g.neovide_refresh_rate_idle = 5
g.neovide_fullscreen = false
g.neovide_remember_window_size = true

-- copy & paste
keymap.set('n', '<D-s>', '<cmd>wa<cr>')      -- Save
keymap.set('i', '<D-s>', '<c-o><cmd>wa<cr>') -- Save
keymap.set('v', '<D-c>', '"+y')              -- Copy
keymap.set('n', '<D-v>', '"+P')              -- Paste normal mode
keymap.set('v', '<D-v>', '"+P')              -- Paste visual mode
keymap.set('c', '<D-v>', '<C-R>+')           -- Paste command mode
keymap.set('i', '<D-v>', '<ESC>"+pa')        -- Paste insert mode

-- ime
local function set_ime(args)
  if args.event:match("Enter$") then
    vim.g.neovide_input_ime = true
  else
    vim.g.neovide_input_ime = false
  end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

-- vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
--   group = ime_input,
--   pattern = "*",
--   callback = set_ime
-- })
--
-- vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
--   group = ime_input,
--   pattern = "[/\\?]",
--   callback = set_ime
-- })
