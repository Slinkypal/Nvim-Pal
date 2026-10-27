return { -- Mason para el LSP Management
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- Otter para Quarto
  {
    'jmbuhr/otter.nvim',
    dev = false,
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    ---@type OtterConfig
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      { "mason-org/mason-lspconfig.nvim" },
    },
    config = function()
			-- Capabilities extendidas para nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Aquí pones tu lista de LSPs (nombres de lspconfig)
      local language_servers = {
        "lua_ls",
        "pyright",
				"r_language_server",
				"clangd",
				"bashls",
				"wc_language_server",
				"yamlls",
				"panache",
				"tinymist",
				"textlsp",
			}	

      require("mason-lspconfig").setup({
        ensure_installed = language_servers,
        automatic_enable = true,
      })
			-- Configurar cada servidor  
			for _, server in ipairs(language_servers) do
       	vim.lsp.enable(server)
				vim.lsp.config(server, {
					capabilities = capabilities, --TODO: Ver como funcionan esta funcion para ver si se detecta de forma correcta
				})
			end	
    end,
  },
}

