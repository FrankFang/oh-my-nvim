return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  _priority = -1,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'ahmedkhalf/project.nvim',
  },
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
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
      }
    }

    require('telescope').load_extension('projects')

  end,
}
