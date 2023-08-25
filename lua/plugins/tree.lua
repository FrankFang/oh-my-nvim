vim.o.confirm = true
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
      vim.cmd("quit") end
  end
})
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      auto_close = true,
      update_focused_file = {
        enable = true,
      },
      sort_by = "case_sensitive",
      view = {
        side = 'right',
        width = 40,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      }
    }
  end,
}

--[[
local m = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup {
      close_if_last_window = false,
      window = {
        position = 'right',
        width = 30,
        mappings = { }
      },
    }
  end,
}

vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Open neo-tree on enter",
  group = "neotree_autoopen",
  callback = function()
    if not vim.g.neotree_opened then
      vim.cmd "Neotree show"
      vim.g.neotree_opened = true
    end
  end,
})

return m
--]]
