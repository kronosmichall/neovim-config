local lspconfig = require("lspconfig")
lspconfig.ruby_ls.setup({
	cmd = { "ruby-lsp" },
	filetypes = { "ruby" },
	root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git"),
	settings = {},
on_attach = function(client, bufnr)
    -- Enable LSP formatting
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

      -- Optional keymap for formatting
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, { buffer = bufnr, desc = "[LSP] Format file" })
    end
})

-- Lua LSP (using lua_ls, previously sumneko_lua)
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = {
        globals = { "vim" }, -- Recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})
