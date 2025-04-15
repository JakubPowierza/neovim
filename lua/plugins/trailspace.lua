-- lua/plugins/trailspace.lua
return {
	"echasnovski/mini.trailspace",
	main = "mini.trailspace",
  dependencies = {
    "echasnovski/mini.nvim"
  },
  event = { "BufRead", "BufNewFile" },
  config = true,
}
