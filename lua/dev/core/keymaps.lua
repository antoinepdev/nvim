vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, key, cmd, opts)
    local default_opts = {
        silent = true,
        unique = true,
        nowait = true,
        desc = "which_key_ignore"
    }

    if opts == nil then
        opts = default_opts
    else
        opts = vim.tbl_deep_extend("force", default_opts, opts)
    end

    vim.keymap.set(mode, key, cmd, opts)
end


-- Basic keymaps
map("n", "<leader>ww", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>Q", ":q!<CR>")
map("i", "jk", "<ESC>") -- Exit insert mode with jk
map("n", "<ESC>", ":nohl<CR>") -- Disable highlight with ESC


-- Window movement
map("n", "gh", "<C-w>h", {desc="Move to left window"})
map("n", "gl", "<C-w>l", {unique = false, desc="Move to left window"})
map("n", "gj", "<C-w>j", {desc="Move to bottom window"})
map("n", "gk", "<C-w>k", {desc="Move to top window"})


-- Terminal
map("n", "<leader>tt", "<cmd>tabnew<CR><cmd>term<CR>i", {desc = "Terminal: New Tab"})
map("t", "<Esc>", "<C-\\><C-n>") -- Exit terminal mode
map("t", "jk", "<C-\\><C-n>") -- Exit terminal mode with jk
