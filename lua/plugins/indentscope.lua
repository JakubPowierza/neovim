-- lua/plugins/indentscope.lua
return {
	"echasnovski/mini.indentscope",
  config = function()
    require("mini.indentscope").setup({
      smbol = '|',
    })
  end
}
