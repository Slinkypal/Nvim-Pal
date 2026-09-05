return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    -- Navegación entre buffers usando la interfaz de bufferline
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Siguiente buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Buffer anterior" },
	},
	opts = {
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
				highlight = "Directory",
			},
		},
	},
	
}

