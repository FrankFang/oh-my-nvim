return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('spectre').setup()
    local wk = require('which-key')
    wk.register({
      ['<leader>'] = {
        s = {
          name = '+ search and replace',
          s = { '<cmd>lua require("spectre").toggle()<CR>', 'Toggle' }
        }
      }
    })
  end
}
