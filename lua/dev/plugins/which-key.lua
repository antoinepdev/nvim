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
      { "<leader>t", group = "Terminal" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>c", group = "Code/Comment" },
      { "<leader>f", group = "Files" },
      { "<leader>?", "<Ignore>", desc = "which_key_ignore" },

      -- Mini Files
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini files (directory of the current file)",
      },
    })
    wk.setup(opts)
  end,
}
