-- helper functions
_G.last_test_term = {
  win = nil,
  buf = nil,
  last_command = nil,
}

local function isRuby()
  if vim.bo.filetype ~= "ruby" then
    print("Not a Ruby file")
    return false
  end
  return true
end

local function runTest(cmd)
  if _G.last_test_term.win and vim.api.nvim_win_is_valid(_G.last_test_term.win) then
    local _ = pcall(function()
      vim.api.nvim_win_close(_G.last_test_term.win, true)
    end)
  end

  vim.cmd("belowright split | resize 10")
  local term_buf = vim.api.nvim_create_buf(false, true)
  local term_win = vim.api.nvim_get_current_win()

  vim.api.nvim_win_set_buf(term_win, term_buf)
  vim.fn.termopen(cmd)

  _G.last_test_term.win = term_win
  _G.last_test_term.buf = term_buf

  vim.cmd("wincmd p") -- go back to previous window (keep focus where it was)
end


vim.keymap.set("n", "<leader>t", function()
  if (not isRuby()) then return end
  local file = vim.fn.expand("%")
  local line = vim.fn.line(".")
  local cmd = { "bin/rails", "test", file .. ":" .. line }
  _G.last_test_term.last_command = cmd

  runTest(cmd)
  -- open terminal split at the bottom, but don't move focus
end, { desc = "Run Rails test on current line", noremap = true, silent = true })

vim.keymap.set("n", "<leader>T", function()
  if (not isRuby()) then return end


  local file = vim.fn.expand("%")
  local line = vim.fn.line(".")
  local cmd = { "bin/rails", "test", file }
  _G.last_test_term.last_command = cmd
  runTest(cmd)
end, { desc = "Run Rails all tests of current file", noremap = true, silent = true })

-- redo last test
vim.keymap.set("n", "<leader>rt", function()
  if (not isRuby()) then return end


  local cmd = _G.last_test_term.last_command
  runTest(cmd)
end, { desc = "Run Rails all tests of current file", noremap = true, silent = true })




