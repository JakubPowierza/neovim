return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- this is to allow for automatically downloading LSP servers
    "williamboman/mason.nvim",
    -- This is so that we don"t have to do require("lspconfig")[server_name].setup for all servers
    "williamboman/mason-lspconfig.nvim",
    -- This is to setup lua env in neovim so it undrstands built in globals such as vim
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

  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers {
      -- default setup for all LSP servers that don"t have an explicit handler
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
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
      sources = cmp.config.sources({ { name = "nvim_lsp" } }),
      mapping = cmp.mapping.preset.insert({
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
    })
  end,
}
