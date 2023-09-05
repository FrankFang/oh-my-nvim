return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.sessions').setup {
      autoread = true,
    }
    require('mini.animate').setup()

    require('mini.indentscope').setup {
      symbol = '▏',
    }
    require('mini.jump2d').setup()
  end
}
