return {
  "folke/which-key.nvim",
  dependencies = {
    "https://github.com/nvim-mini/mini.icons",
  },
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 500,
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },

  config = function(_, opts)
    local wk = require("which-key")

    wk.add({
      -- Basics
      { "<leader>w", group = "Windows" },
      { "<leader>t", group = "Terminal" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>c", group = "Code/Comment" },
      { "<leader>f", group = "Files" },
      { "<leader>e", group = "Explore" },
      { "<leader>g", group = "Git" },
      { "<leader>?", "<Ignore>", desc = "which_key_ignore" },

      -- Mini Files
      {
        "<leader>ee",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Explore current directory",
      },
      {
        "<leader>en",
        function()
          require("mini.files").open(os.getenv("NOTES_VAULT_PATH"), true)
        end,
        desc = "Explore notes vault",
      },

      -- Git
      {
        "<leader>gd",
        ":Gitsigns diffthis<CR>",
        { desc = "Show diff in current file" },
      },
      {
        "<leader>gt",
        ":Gitsigns toggle_signs<CR>",
        { desc = "Toggle signs" },
      },
      {
        "<leader>gsh",
        ":Gitsigns stage_hunk<CR>",
        { desc = "Stage hunk" },
      },
      {
        "<leader>gsH",
        ":Gitsigns undo_stage_hunk<CR>",
        { desc = "Unstage hunk" },
      },
      {
        "<leader>gsa",
        ":Gitsigns stage_buffer<CR>",
        { desc = "Stage all" },
      },
      {
        "<leader>gsA",
        ":Gitsigns reset_buffer_index<CR>",
        { desc = "Unstage all" },
      },
      {
        "<leader>gj",
        ":Gitsigns next_hunk<CR>",
        { desc = "Go to next hunk" },
      },
      {
        "<leader>gk",
        ":Gitsigns prev_hunk<CR>",
        { desc = "Go to prev hunk" },
      },
      {
        "<leader>gp",
        ":Gitsigns preview_hunk<CR>",
        { desc = "Preview hunk" },
      },
    })
    wk.setup(opts)
  end,
}
