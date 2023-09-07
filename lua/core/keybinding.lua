local helper = require("core.helper")

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")


helper.insert_and_normal_mode_map {
  ["<f5>"] = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
  ["<f1>"] = { '"', "Registers" },
  ["<A-Right>"] = { '<cmd>BufferMoveNext<cr>', 'Buffer Move' },
  ["<A-Left>"] = { '<cmd>BufferMovePrevious<cr>', 'Buffer Move' },
  ["<A-P>"] = { '<cmd>BufferPin<cr>', 'Buffer Pin' },
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
    -- j = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Quick Fix" },
    j = { "<cmd>Lspsaga code_action<cr>", "Quick Fix" },
    p = { "<cmd>Lspsaga peek_definition<cr>", "Definition" },
    --D = { "<cmd>Lspsaga goto_definition<cr>", "Go To Definition" },
    --i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "implementation" },
    --n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Jump Next" },
    --N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Jump Prev" },
    ['*'] = { "gd[{V%::s/<C-R>///gc<left><left><left>", "Rename All" },
  },
  K = {
    name = '+Kan',
    K = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'LSP info' },
  },
  ["<leader>"] = {
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
      r = { "<cmd>Telescope registers<cr>", "Open Recent File" },
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