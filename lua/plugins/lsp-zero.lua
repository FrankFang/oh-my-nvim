local m =  {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'MunifTanjim/prettier.nvim' },
    { "nvimdev/lspsaga.nvim" }, -- Better LSP UI
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
  },
  config = function()
    local lsp = require('lsp-zero').preset({})
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    lsp.preset('recommended')
    lsp.ensure_installed({
      'tsserver',
      'eslint',
    })

    local function filter(arr, fn)
      if type(arr) ~= "table" then
        return arr
      end

      local filtered = {}
      for k, v in pairs(arr) do
        if fn(v, k, arr) then
          table.insert(filtered, v)
        end
      end

      return filtered
    end

    local function filterReactDTS(value)
      return string.match(value.filename, 'react/index.d.ts') == nil
    end

    local function on_list(options)
      local items = options.items
      if #items > 1 then
        items = filter(items, filterReactDTS)
      end
      vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
      vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
    end

    -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#default_keymapsopts
    -- lsp.on_attach(function(client, bufnr)
    --   lsp.default_keymaps({ buffer = bufnr })
    -- end)
    -- https://www.reddit.com/r/neovim/comments/107g8lg/how_to_ignore_node_modules_when_using/j3mieqc/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition { on_list = on_list } end, bufopts)
      vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', bufopts)
      vim.keymap.set('n', 'gD', '<cmd>Lspsaga peek_definition<cr>', bufopts)
    end)

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
    lsp.setup()

    -- Make sure you setup `cmp` after lsp-zero

    local cmp = require('cmp')

    cmp.setup({
      preselect = 'item',
      sources = {
        -- Copilot Source
        { name = "copilot",  group_index = 2 },
        -- Other Sources
        { name = "nvim_lsp", group_index = 2 },
        { name = "path",     group_index = 2 },
        { name = "luasnip",  group_index = 2 },
      },
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        })
      }
    })

    -- saga
    local saga = require('lspsaga')
    saga.setup()

    -- null-ls
    local null_ls = require("null-ls")

    local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
    local event = "BufWritePre" -- or "BufWritePost"
    local async = event == "BufWritePost"

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          -- vim.keymap.set("n", "<Leader>l", function()
          --   vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          -- end, { buffer = bufnr, desc = "[lsp] format" })

          -- format on save
          vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
          vim.api.nvim_create_autocmd(event, {
            buffer = bufnr,
            group = group,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, async = async })
            end,
            desc = "[lsp] format on save",
          })
        end

        if client.supports_method("textDocument/rangeFormatting") then
          vim.keymap.set("x", "<Leader>l", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = bufnr, desc = "[lsp] format" })
        end
      end,
    })

    -- prettier
    local prettier = require("prettier")

    prettier.setup({
      bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "css", "graphql", "html", "javascript", "javascriptreact", "json", "less", "markdown", "scss",
        "typescript", "typescriptreact", "yaml",
      },
    })

    -- typescript
    require('lspconfig').tsserver.setup({
      capabilities = lsp_capabilities,
      init_options = {
        preferences = {
          importModuleSpecifierPreference = 'non-relative',
          importModuleSpecifierEnding = 'minimal',
        },
      },
    })
  end
}

return m


