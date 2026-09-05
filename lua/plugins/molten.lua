return {
	{
		"benlubas/molten-nvim",
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		keys = {
			{ "<leader>mi", ":MoltenInit<CR>", desc = "Initialize the plugin", silent = true },
		},
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
		end,
	},
	{
		"3rd/image.nvim",
		build = false,
		opts = {
			backend = "kitty",
			processor = "magick_cli",
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge, -- necessary for a good experience
			max_width_window_percentage = math.huge,
		},
	},
}
