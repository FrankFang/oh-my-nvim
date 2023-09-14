return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require 'toggleterm'.setup {
      direction = 'float'
    }

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      vim.keymap.set('t', '<C-d>', [[<C-\><C-n><cmd>close<cr>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local Terminal = require('toggleterm.terminal').Terminal
    local on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<A-1>", "<Cmd>lua _term_toggle()<CR>",
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<A-2>", "<Cmd>lua _lazygit_toggle()<CR>",
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<D-1>", "<Cmd>lua _term_toggle()<CR>",
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<D-2>", "<Cmd>lua _lazygit_toggle()<CR>",
        { noremap = true, silent = true })
    end
    local on_close = function(term)
      vim.cmd("startinsert!")
    end

    local term = Terminal:new({
      count = 1,
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = on_open,
      on_close = on_close
    })

    function _term_toggle()
      term:toggle()
    end

    local lazygit = Terminal:new({
      count = 2,
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = on_open,
      on_close = on_close
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end
  end
}
