vim.g.mapleader = " " -- set leader key
vim.g.maplocalleader = " " -- set local leader key

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

map("n", "<leader>ww", ":w<CR>") -- Write file
map("n", "<leader>q", ":q<CR>") -- Quit
map("n", "<leader>Q", ":q!<CR>") -- Quit anyway
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

-- Delete
map("n", "x", '"_x') -- Delete an charcter without copy
map("v", "x", '"_d') -- Delete selected code without copy
