return{
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		compile = false,
		colors = {
			palette ={},
			theme = { wave = {}, lotus = {}, dragon =  {}, all = {}},

		},
		theme = "wave",
		background = {
			dark = "dragon",
			light = "wave",
		},
		
	},
	config = function(_, opts)
		require("kanagawa").setup(opts)
		vim.cmd("colorscheme kanagawa")
		
	end,

}
