vim.api.nvim_create_autocmd("VimLeavePre", {
  desc = "Close trouble on exit",
  group = vim.api.nvim_create_augroup("TroubleAutoClose", { clear = true }),
  callback = function()
    local trouble = require('trouble')
    trouble.close()
  end,
})

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local trouble = require('trouble')
    trouble.setup {}
    local wk = require("which-key")
    wk.register({
      ["<leader>x"] = { name = "+trouble" },
      ["<leader>xx"] = { function() trouble.open() end, "Open Trouble" },
      ["<leader>xw"] = { function() trouble.open("workspace_diagnostics") end, "Workspace Diagnostics" },
      ["<leader>xd"] = { function() trouble.open("document_diagnostics") end, "Document Diagnostics" },
      ["<leader>xq"] = { function() trouble.open("quickfix") end, "Quickfix" },
      ["<leader>xl"] = { function() trouble.open("loclist") end, "Loclist" },
      ["<leader>xc"] = { function() trouble.close() end, "Close Trouble" },
      ["gR"] = { function() trouble.open("lsp_references") end, "LSP References" },
    }, { mode = "n", noremap = true })
  end,
}
