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
        j = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Quick Fix" },
        d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
        i = { "<Cmd>lua vim.lsp.buf.implementation()<CR>", "implementation" },
        r = { "<Cmd>lua vim.lsp.buf.references()<CR>", "References" },
        s = { "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature" },
      },
      K = {
        name = '+Hover',
        K = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'LSP info' },
      },
      ["<tab>"] = { '<Cmd>BufferNext<CR>', 'BufferNext' },
      ["<s-tab>"] = { '<Cmd>BufferPrevious<CR>', 'BufferPrev' },
      ["<leader>"] = {
        k = {
          name = '+panel',
          ['1'] = { "<Cmd>NvimTreeToggle<CR>", "Tree" }
        },
        l = {
          l = { "<Cmd>Prettier<CR>", "Prettier" },
          k = { "<Cmd>lua vim.lsp.buf.format()<CR>", "Foramt via LSP" }
        },
        z = {
          t = { "zfit", "Fold Tag" },
          d = { "zfi{", "Fold {}" },
        },
        b = {
          b = { "<Cmd>BufferClose<CR>", "Close Current Buffer" },
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
        t = {
          name = '+tab',
          t = { "<Cmd>tabnext<cr>", "Next Tab" },
          p = { "<Cmd>tabprevious<cr>", "Previous Tab" },
        }
      },
    }, { mode = 'n' })
  end
}
