return {
  -- Mason para el LSP Management
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
      local servers = {
        "lua_ls",
        "pyright",
				"clangd",
				"bashls",
				"wc_ls",
			}

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = true,
      })
			-- Configurar cada servidor con las capabilities de cmp
      for _, server in ipairs(servers) do
        require("lspconfig")[server].setup({
          capabilities = capabilities,
        })
      end
    end,
  },
}

