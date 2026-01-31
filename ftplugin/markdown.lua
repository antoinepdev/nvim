-- opts
local opt = vim.opt_local

opt.wrap = true
opt.linebreak = true
opt.conceallevel = 2 -- hide concealed text
opt.concealcursor = "n" -- hide concealed text in normal mode
opt.number = false -- hide line number
opt.relativenumber = false -- hide line number

-- spelling
opt.spell = true
opt.spelllang = { "es", "en" }
