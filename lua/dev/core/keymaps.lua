vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, key, cmd, opts)
  local default_opts = {
    silent = true,
    unique = true,
    nowait = true,
    desc = "which_key_ignore",
  }

  if opts == nil then
    opts = default_opts
  else
    opts = vim.tbl_deep_extend("force", default_opts, opts)
  end

  vim.keymap.set(mode, key, cmd, opts)
end
map("n", "gw", "<ignore>")
-- Basic keymaps
map("n", "<leader>ww", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>Q", ":q!<CR>")
map("i", "jk", "<ESC>") -- Exit insert mode with jk
map("n", "<ESC>", ":nohl<CR>") -- Disable highlight with ESC

-- Window management
map("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Move to top window" })
map("n", "<leader>wf", function()
  local opt = vim.opt
  if opt.number:get() == true or opt.relativenumber:get() == true then
    opt.number = false
    opt.relativenumber = false
  else
    opt.number = true
    opt.relativenumber = true
  end
end, { desc = "Toggle fullscreen" })

-- Terminal
map(
  "n",
  "<leader>tt",
  "<cmd>tabnew<CR><cmd>term<CR>i",
  { desc = "Terminal: New Tab" }
)
map("t", "<Esc>", "<C-\\><C-n>") -- Exit terminal mode
map("t", "jk", "<C-\\><C-n>") -- Exit terminal mode with jk

-- Tabs
map("n", "<leader>1", "<cmd>tabnew<CR>", { desc = "New Tab" })
map("n", "<leader><Tab>", "<cmd>tabnext<CR>", { desc = "Next Tab" })
map("n", "<leader>º", "<cmd>tabprevious<CR>", { desc = "Previous Tab" })

-- Delete
map("n", "x", '"_x') -- Delete an charcter without copy
map("v", "x", '"_d') -- Delete selected code without copy

-- Go to
map(
  { "n", "v" },
  "gm",
  "%",
  { desc = "Matching current parenthesis or bracket" }
)
map("i", "<C-h>", "<Esc>i", { unique = false }) -- Skip next key
map("i", "<C-l>", "<Esc>la", { unique = false }) -- Skip to previous key
map({ "n", "v" }, "H", "0", { unique = false }) -- Go to the beginning of the line
map({ "n", "v" }, "L", "$", { unique = false }) -- Go to the end of the line

-- Copy
map("n", "ya", ":%y<CR>") -- Copy all
