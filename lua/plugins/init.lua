vim.pack.add({
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/neovim/nvim-lspconfig",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

require('plugins.lualine')
require('plugins.treesitter')
require('plugins.blink')
require('plugins.kanagawa')
require('plugins.oil')
require('plugins.flash')
require('plugins.snacks')
require('plugins.autopairs')
