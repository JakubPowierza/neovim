return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- this is to allow for automatically downloading LSP servers
    "williamboman/mason.nvim",
    -- This is so that we don"t have to do require("lspconfig")[server_name].setup for all servers
    "williamboman/mason-lspconfig.nvim",
    -- This is to setup lua env in neovim so it understands built in globals such as vim
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    -- This is autocompletion
    "hrsh7th/nvim-cmp",
    -- This lets autocompletion use lsp
    "hrsh7th/cmp-nvim-lsp",
    -- This lets autocompletion use buffer symbols
    "hrsh7th/cmp-buffer",
    -- lets us close parenthesis when completign function
    'windwp/nvim-autopairs',
  },
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers {
      -- default setup for all LSP servers that don"t have an explicit handler
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities
        }
      end,

      -- custom handlers
      -- ["rust_analyzer"] = function ()
        --   require("rust-tools").setup {}
        -- end
      }

      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
        preselect = cmp.PreselectMode.None,
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
        }),
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  }
