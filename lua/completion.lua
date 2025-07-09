local blink = require("blink.cmp")
blink.setup({
    keymap = { preset = "super-tab" },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = {
        auto_show = true,
        treesitter_highlighting = true,
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  })

