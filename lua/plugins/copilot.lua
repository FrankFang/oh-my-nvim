local helper = require('core.helper')
local node_path = helper.trim(helper.exec('which node'))
if node_path == '' then
  print('Node.js is not installed')
end
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
        auto_refresh = true,
        layout = {
          position = "right", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
      },
      copilot_node_command = node_path, -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })
  end,
}
