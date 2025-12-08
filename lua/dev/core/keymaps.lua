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
