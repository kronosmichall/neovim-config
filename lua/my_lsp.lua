local lspconfig = require('lspconfig')
lspconfig.ruby_lsp.setup({
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
  },
})


lspconfig.pyright.setup({
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- or "basic"/"strict" as you prefer
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      }
    }
  }
})

lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      -- Enable autoimports
      gofumpt = true, -- stricter formatting
      usePlaceholders = false,
      completeUnimported = true,
    },
  },
  on_attach = function(client, bufnr)
    -- Format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("GoFormat", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})

lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- For Neovim
      },
      diagnostics = {
        globals = { 'vim' }, -- Recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Avoid telemetry popup
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.svelte.setup({})
lspconfig.terraformls.setup({})

-- local metals_config = require("metals").bare_config()
--
-- metals_config.settings = {
--   showImplicitArguments = true,
--   excludedPackages = {},
-- }
--
-- metals_config.init_options.statusBarProvider = "on"
--
-- metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- -- Autocmd to start Metals only for Scala files
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "scala", "sbt" },
--   callback = function()
--     require("metals").initialize_or_attach(metals_config)
--   end,
-- })
