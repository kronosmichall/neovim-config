return {
  "stevearc/conform.nvim",
  lazy = false, -- Load conform on startup
  keys = {
    {
      "<f2>",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "", -- Applies in all modes (Normal, Visual, etc.)
      desc = "Format buffer",
    },
  },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },                -- You can specify multiple formatters
      javascript = { { "prettierd", "prettier" } }, -- prettierd is faster if available
      typescript = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      -- rust = { "rustfmt" },
      -- go = { "gofmt" },
      ruby = {},
      -- You can also use a table for a formatter to pass specific options
      -- sh = { { "shfmt", extra_args = { "-i", "2" } } },
    },

    -- Set up format on save
    -- This will run autoformat for the current buffer on BufWritePre (before saving)
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true, -- Try LSP formatter if no conform formatter is found
    -- },
  },
  init = function()
    -- If you want to enable format-on-save for ALL filetypes (not just those explicitly listed)
    -- This ensures format_on_save works even if you don't list a formatter for a filetype.
    -- It will then fall back to LSP if available.
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("ConformFormat", { clear = true }),
      buffer = 0, -- Apply to current buffer
      callback = function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
    })
  end,
}
