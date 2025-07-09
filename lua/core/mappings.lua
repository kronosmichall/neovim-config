-- movement
-- vim.keymap.set("n", "-", vim.cmd.Ex)

-- telescope
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find in files" })
-- vim.keymap.set("n", "<leader>s", builtin.live_grep, { desc = "Telescope live grep" })
-- vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
-- vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })

local fzf = require("fzf-lua")
vim.keymap.set('n', '<leader>f', fzf.files, { desc = 'FzfLua: Find files' })
vim.keymap.set('n', '<leader>s', fzf.live_grep, { desc = 'FzfLua: Live grep' })
vim.keymap.set('n', '<leader>b', fzf.buffers, { desc = 'FzfLua: Buffers' })

-- lazygit
vim.keymap.set("n", "<leader>g", function()
  vim.cmd("LazyGit")
end, { desc = "Open LazyGit" })

-- windows
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Move to last window" })

vim.keymap.set("n", "<leader>w_", "<cmd>split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>w|", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>wq", "<C-w>c", { desc = "Close window" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equalize windows" })

vim.keymap.set("n", "<leader>w+", "<C-w>+", { desc = "Increase height" })
vim.keymap.set("n", "<leader>w-", "<C-w>-", { desc = "Decrease height" })
vim.keymap.set("n", "<leader>w<", "<C-w><", { desc = "Decrease width" })
vim.keymap.set("n", "<leader>w>", "<C-w>>", { desc = "Increase width" })


vim.keymap.set('n', '<C-b>', function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = 'Close all buffers except current' })
-- save
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc>:w<CR>", { desc = "Save current file" })

opts = {}
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition", unpack(opts) })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration", unpack(opts) })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation", unpack(opts) })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References", unpack(opts) })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation", unpack(opts) })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol", unpack(opts) })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", unpack(opts) })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic", unpack(opts) })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic", unpack(opts) })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "open float", unpack(opts) })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "set loc list", unpack(opts) })

vim.keymap.set("n", "<C-c>", function()
  local filepath = vim.fn.expand("%")
  local line = vim.fn.line(".")
  local result = filepath .. ":" .. line
  vim.fn.setreg("+", result)
  print("Copied: " .. result)
end, { desc = "Copy file path and line to clipboard" })

vim.keymap.set("n", "<C-f>", function()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients > 0 then
    vim.lsp.buf.format({ async = true })
  else
    vim.notify("No LSP client attached to this buffer.", vim.log.levels.WARN)
  end
end, { desc = "Format with LSP", silent = true })
