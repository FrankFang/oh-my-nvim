return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = true,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<tab>"] = { '<Cmd>BufferNext<CR>', 'BufferNext' },
      ["<s-tab>"] = { '<Cmd>BufferPrevious<CR>', 'BufferPrev' },
      ["<leader>"] = {
        z = {
          t = { "zfit", "Fold Tag" },
          d = { "zfi{", "Fold {}" },
        },
        b = {
          b = { "<Cmd>BufferClose<CR>", "Close Current Buffer" },
        },
        f = {
          p = { "<esc>:echo expand('%:p')<cr>", "Path" },
        },
        j = {
          j = { "<esc>:lua vim.lsp.buf.code_action()<cr>", "Fix" }
        },
        r = {
          name = '+reload',
          r = { "<esc>:source $MYVIMRC<cr>", "Reload Config" }
        },
        t = {
          name = '+tab',
          t = { "<esc>:tabnext<cr>", "Next Tab" },
          p = { "<esc>:tabprevious<cr>", "Previous Tab" },
        }
      },
      g = {
        name = '+go',
        q = { "Format" }
      }
    }, { mode = 'n' })
  end
}
