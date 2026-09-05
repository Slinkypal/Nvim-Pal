return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')

    ts.setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
    })

    local parsers = {
      "python",
      "markdown",
      "markdown_inline",
      "javascript",
      "html",
      "css",
      "java",
      "cpp",
      "lua",
    }

    ts.install(parsers)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
