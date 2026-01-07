-- opts
local opt = vim.opt_local
opt.wrap = true
opt.linebreak = true

-- keymaps
vim.keymap.set("n", "j", "gj") -- move between wrapped text
vim.keymap.set("n", "k", "gk") -- move between wrapped text
vim.keymap.set("n", "gj", "j") -- move between wrapped text
vim.keymap.set("n", "gk", "k") -- move between wrapped text
