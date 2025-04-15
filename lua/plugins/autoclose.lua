-- lua/plugins/autoclose.lua
return {
	"m4xshen/autoclose.nvim",
  config = function()
    require("autoclose").setup()
  end
}
