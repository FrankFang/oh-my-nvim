return {
  "catppuccin/nvim", 
  priority = 1000,
  name = "catppuccin", 
  config = function()
    require("catppuccin") .setup({
      flavour = "latte", -- latte, frappe, macchiato, mocha
    })
    --vim.cmd.colorscheme "catppuccin"
  end,
}
