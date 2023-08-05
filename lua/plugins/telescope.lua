return {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ["<c-h>"] = "which_key",
            ["<c-t>"] = trouble.open_with_trouble 
          },
          n = { 
            ["<c-t>"] = trouble.open_with_trouble 
          },
        }
      },
    }

    -- require('telescope').load_extension('fzf')
    require('telescope').load_extension('projects')

    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        f = {
          name = "+file",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          g = { "<cmd>Telescope live_grep<cr>", "Grep" },
          b = { "<cmd>Telescope buffers<cr>", "Buffers" },
          h = { "<cmd>Telescope help_tags<cr>", "Help" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
          n = { "<cmd>enew<cr>", "New File" },
        },
      },
    })
  end,
}
