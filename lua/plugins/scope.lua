-- lua/plugins/scope.lua
return {
  {
    "echasnovski/mini.indentscope",
    config = function()
      local indentscope = require("mini.indentscope")
      indentscope.setup({
        symbol = "|",
        draw = {
          delay = 0,
          animation = indentscope.gen_animation.none()
        },
        options = {
          indent_at_cursor = false,
          try_as_border = true,
        },
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    main = "ibl",
    config = function()
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#E6C384" }) -- carpYellow Kanagawa
      require("ibl").setup({
        indent = {
          char = "|"
        },
        scope = {
          enabled = false,
        }
      })
    end
  }
}
