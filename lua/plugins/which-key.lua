return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.register({
      g = {
        name = '+go',
        f = { "<Cmd>lua vim.lsp.buf.format()<CR>", "Format" },
        -- j = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Quick Fix" },
        j = { "<Cmd>Lspsaga code_action<CR>", "Quick Fix" },
        p = { "<Cmd>Lspsaga peek_definition<CR>", "Definition" },
        --D = { "<Cmd>Lspsaga goto_definition<CR>", "Go To Definition" },
        --i = { "<Cmd>lua vim.lsp.buf.implementation()<CR>", "implementation" },
        --n = { "<Cmd>Lspsaga diagnostic_jump_next<CR>", "Jump Next" },
        --N = { "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump Prev" },
        ['*'] = { "gd[{V%::s/<C-R>///gc<left><left><left>", "Rename All" },
      },
      K = {
        name = '+Hover',
        K = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'LSP info' },
      },
      ["<tab>"] = { '<Cmd>BufferNext<CR>', 'BufferNext' },
      ["<s-tab>"] = { '<Cmd>BufferPrevious<CR>', 'BufferPrev' },
      ["<leader>"] = {
        d = {
          "\"_d", "Delete into null"
        },
        k = {
          name = '+panel',
          ['1'] = { "<Cmd>NvimTreeToggle<CR>", "Tree" }
        },
        l = {
          l = { "<Cmd>Prettier<CR>", "Prettier" },
          k = { "<Cmd>lua vim.lsp.buf.format()<CR>", "Foramt via LSP" },
          n = { "<Cmd>nohl<CR>", "No Highlight" },
        },
        z = {
          t = { "zfit", "Fold Tag" },
          d = { "zfi{", "Fold {}" },
        },
        b = {
          b = { "<Cmd>BufferClose<CR>", "Close Current Buffer" },
          k = { "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", "Close The Other Buffers" },
        },
        f = {
          name = "+file",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          g = { "<cmd>Telescope live_grep<cr>", "Grep" },
          b = { "<cmd>Telescope buffers<cr>", "Buffers" },
          h = { "<cmd>Telescope help_tags<cr>", "Help" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
          n = { "<cmd>enew<cr>", "New File" },
          p = { "<Cmd>echo expand('%:p')<cr>", "Path" },
        },
        j = {
          j = { "<Cmd>lua vim.lsp.buf.code_action()<cr>", "Fix" }
        },
        r = {
          name = '+reload',
          r = { "<Cmd>source $MYVIMRC<cr>", "Reload Config" }
        },
        s = {
          name = '+search|session|save',
          s = { '<cmd>lua require("spectre").toggle()<CR>', 'Search in Folder' },
          l = { '<cmd>silent! loadview 1<CR>', 'Load View 1' },
          k = { '<cmd>mkview 1<CR>', 'Make View 1' },
          t = { '<cmd>ASToggle<CR>', 'Auto Save' }
        },
        t = {
          name = '+tab',
          t = { "<Cmd>tabnext<cr>", "Next Tab" },
          p = { "<Cmd>tabprevious<cr>", "Previous Tab" },
        },
        p = {
          "<Cmd>Telescope commander<cr>", "Commander Center"
        }
      },
    }, { mode = 'n' })
  end
}
