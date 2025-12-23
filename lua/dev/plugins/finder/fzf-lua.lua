local file_finder_opts = {
  find_opts = [[-type f \! -path '*/.git/*' \! -path '*/.obsidian/*']],
  rg_opts = [[--color=never --hidden --files -g "!.git" -g "!.obsidian"]],
  fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude .obsidian --exclude .trash]],
  git_icons = false,
  file_icons = false,
  color_icons = false,
}
-- File Picker
return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-mini/mini.icons" },
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = {
    files = file_finder_opts,
  },
  config = function()
    require("fzf-lua").setup({
      fzf_colors = true,
      fzf_opts = {
        ["--no-scrollbar"] = false,
        ["--cycle"] = true,
        ["--ansi"] = true,
        ["--height"] = "100%",
        ["--highlight-line"] = true,
      },
      defaults = {
        formatter = "path.dirname_first", -- show greyed-out directory before filename
      },
      winopts = {
        height = 0.90,
        width = 0.80,
        preview = {
          layout = "vertical",
        },
      },
      keymap = {
        fzf = {
          -- couldn't make the Alt key work, likely due to this issue:
          -- https://github.com/LazyVim/LazyVim/discussions/4029
          -- https://www.reddit.com/r/neovim/comments/vfqseq/enable_special_keyboard_combinations_in_alacritty/
          ["ctrl-k"] = "up",
          ["ctrl-j"] = "down",
          ["ctrl-b"] = "preview-page-up",
          ["ctrl-f"] = "preview-page-down",
          ["ctrl-u"] = "half-page-up", -- in list of search results
          ["ctrl-d"] = "half-page-down", -- in list of search results
          ["ctrl-c"] = "abort",
        },
      },
    })
  end,
  keys = {
    -- Alt-h toggles hidden files in search results on/off
    {
      "<leader>ff",
      "<cmd>FzfLua files<cr>",
      desc = "find files in project directory",
    },
    {
      "<leader>/",
      "<cmd>FzfLua live_grep<cr>",
      desc = "grep (not fuzzy)",
    },
    {
      "<leader>fg",
      "<cmd>FzfLua grep<cr>",
      desc = "grep (fuzzy)",
    },
    {
      "<leader>fs",
      "<cmd>FzfLua lgrep_curbuf<cr>",
      desc = "find string in current buffer",
    },
    {
      "<leader>fw",
      "<cmd>FzfLua grep_cword<cr>",
      desc = "find current word",
    },
    {
      "<leader>fW",
      "<cmd>FzfLua grep_cWORD<cr>",
      desc = "find current WORD",
    },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "find open buffers" },
    {
      "<leader>fd",
      "<cmd>FzfLua diagnostics_document<cr>",
      desc = "[f]ind [d]iagnostics",
    },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "find old files" },
    {
      "<leader>fO",
      "<cmd>FzfLua nvim_options<cr>",
      desc = "[f]ind [o]ld files",
    },
    {
      "<leader>fh",
      "<cmd>FzfLua helptags<cr>",
      desc = "find help",
    },
    {
      "<leader>fn",
      function()
        require("fzf-lua").files(
          vim.tbl_extend(
            "force",
            { cwd = os.getenv("OBSIDIAN_VAULT_PATH") },
            file_finder_opts
          )
        )
      end,
      desc = "find notes",
    },
    { "<leader>ft", "<cmd>FzfLua undotree<cr>", desc = "Undotree" },
    {
      "<leader>fc",
      function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end,
      desc = "find in neovim configuration",
    },
  },
}
