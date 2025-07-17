return {
  -- Lazy itself
  { "folke/lazy.nvim",      version = "*" },

  -- Colorscheme
  { "folke/tokyonight.nvim" },

  -- Telescope + dependency
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
  },
  --   -- Lazygit
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    ensure_installed = {
      "svelte",
      "hcl",
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },

  -- Comment.nvim with config
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  { "neovim/nvim-lspconfig" },
  -- LSP config
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   dependencies = { "williamboman/mason.nvim" },
  -- },
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = "1.*",
  },

  -- ~/.config/nvim/lua/plugins/oil.lua
  {
    "stevearc/oil.nvim",
    opts = {
      -- Optional: automatically open oil when opening a directory
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory (Oil)" },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "chentoast/marks.nvim",
    opts = {},
    config = function()
      require("marks").setup()
    end,
    event = "BufReadPost",
  },
  -- {
  --   "scalameta/nvim-metals",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   -- ft = { "scala", "sbt" },
  -- }
}
