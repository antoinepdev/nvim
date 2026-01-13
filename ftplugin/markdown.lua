-- opts
local opt = vim.opt_local
opt.wrap = true
opt.linebreak = true
opt.conceallevel = 2 -- hide concealed text
opt.concealcursor = "n" -- hide concealed text in normal mode
opt.number = false -- hide line number
opt.relativenumber = false -- hide line number

-- keymaps
vim.keymap.set("n", "j", "gj") -- move between wrapped text
vim.keymap.set("n", "k", "gk") -- move between wrapped text
vim.keymap.set("n", "gj", "j") -- move between wrapped text
vim.keymap.set("n", "gk", "k") -- move between wrapped text
