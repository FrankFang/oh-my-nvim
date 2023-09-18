local helper = require("core.helper")

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.cmd [[
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
]]

local cmd_toggle_term = "<Cmd>lua _term_toggle()<CR>"
local cmd_toggle_lazygit = "<Cmd>lua _lazygit_toggle()<CR>"
local cmd_toggle_tree = "<Cmd>NvimTreeToggle<CR>"
local cmd_toggle_outline = "<Cmd>SymbolsOutline<CR>"

helper.insert_and_normal_mode_map {
  ["<f5>"] = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
  ["<f1>"] = { '"', "Registers" },
  ["<A-Right>"] = { '<cmd>BufferMoveNext<cr>', 'Buffer Move' },
  ["<A-Left>"] = { '<cmd>BufferMovePrevious<cr>', 'Buffer Move' },
  ["<A-P>"] = { '<cmd>BufferPin<cr>', 'Buffer Pin' },
  ["<c-s>"] = { '<cmd>wa<cr>', 'Save' },
  ['<A-1>'] = { cmd_toggle_tree, "Toggle Tree" },
  ['<A-2>'] = { cmd_toggle_lazygit, "Toggle Lazygit" },
  ['<A-3>'] = { cmd_toggle_term, "Toggle Term" },
  ['<A-4>'] = { cmd_toggle_outline, "Toggle Outline" },
  ['<D-1>'] = { cmd_toggle_tree, "Toggle Tree" },
  ['<D-2>'] = { cmd_toggle_lazygit, "Toggle Lazygit" },
  ['<D-3>'] = { cmd_toggle_term, "Toggle Term" },
  ['<D-4>'] = { cmd_toggle_outline, "Toggle Outline" },
}

helper.insert_mode_map({
  ['<m-l>'] = {
    function() require("copilot.suggestion").accept_line() end,
    "Accept Line"
  },
  ['<d-l>'] = {
    function() require("copilot.suggestion").accept_line() end,
    "Accept Line"
  },
})

helper.normal_mode_map({
  ["<tab>"] = { '<cmd>BufferNext<cr>', 'Buffer Next' },
  ["<S-tab>"] = { '<cmd>BufferPrevious<cr>', 'Buffer Previous' },
  g = {
    name = '+go',
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    F = { "<cmd>Lspsaga finder<cr>", "Find Usage" },
    q = { "<cmd>Lspsaga code_action<cr>", "Quick Fix" },
    n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Jump Next" },
    N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Jump Prev" },
  },
  K = {
    name = '+Kan',
    -- K = { '<cmd>Lspsaga hover_doc<cr>', 'LSP info' },
  },
  ["<leader>"] = {
    ['1'] = { cmd_toggle_tree, "Toggle Tree" },
    ['2'] = { cmd_toggle_lazygit, "Toggle Lazygit" },
    ['3'] = { cmd_toggle_term, "Toggle Term" },
    ['4'] = { cmd_toggle_outline, "Toggle Outline" },
    b = {
      b = { "<cmd>BufferClose<cr>", "Close Current Buffer" },
      k = { "<cmd>BufferCloseAllButCurrentOrPinned<cr>", "Close The Other Buffers" },
    },
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      ['/'] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy Search Current File" },
      g = { "<cmd>Telescope live_grep<cr>", "Grep" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      r = { "<cmd>Telescope frecency workspace=CWD<cr>", "Recent Files" },
      m = { "<cmd>Telescope marks<cr>", "Open Marks" },
      p = { "<cmd>echo expand('%:p')<cr>", "Path" },
    },
    r = {
      name = '+reload',
      r = { "<cmd>source $MYVIMRC<cr>", "Reload Config" },
      l = { function() require('lazy-reload').feed() end, "Reload Plugin" },
    },
    s = {
      name = '+search|session|save',
      s = { '<cmd>lua require("spectre").toggle()<cr>', 'Search in Folder' },
      l = { '<cmd>silent! loadview 1<cr>', 'Load View 1' },
      k = { '<cmd>mkview 1<cr>', 'Make View 1' },
      t = { '<cmd>ASToggle<cr>', 'Auto Save' }
    },
    t = {
      name = '+tab',
      t = { "<cmd>tabnext<cr>", "Next Tab" },
      p = { "<cmd>tabprevious<cr>", "Previous Tab" },
    },
    p = {
      "<cmd>Telescope commander<cr>", "Commander Center"
    }
  },
})
