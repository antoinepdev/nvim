vim.lsp.enable({
  "lua_ls",
})

vim.diagnostic.config({


  virtual_text = true, -- display inline diagnostics
  underline = true, -- underline the lines with errors or warnings
  update_in_insert = false, -- diagnostics not update meanwhile insertion mode is active
  virtual_lines = false, -- display diagnostics on a separate line
  severity_sort = true, -- diagnostics sort per severity level

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})


-- Keymaps
vim.keymap.set("n", "<space>dd", vim.diagnostic.open_float, {desc="Display diagnostic", noremap = true, silent = true, buffer = bufnr })
vim.keymap.set("n", "<space>dn", vim.diagnostic.goto_next, {desc="Go to next diagnostic"})
vim.keymap.set("n", "<space>dp", vim.diagnostic.goto_prev, {desc="Go to previous diagnostic"})
