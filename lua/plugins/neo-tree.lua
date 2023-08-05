return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup {
      window = {
        position = 'right',
        width = 30,
      },
    }
    --[[
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
    --]]
  end,
}
