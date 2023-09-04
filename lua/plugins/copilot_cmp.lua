local m = {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  event = { "InsertEnter", "LspAttach" },
  fix_pairs = true,
  config = function()
    require("copilot_cmp").setup()
  end
}

return {}
