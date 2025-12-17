return {
  "folke/which-key.nvim",
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
      { "<leader>?", "<Ignore>", desc = "which_key_ignore" },
    })
    wk.setup(opts)
  end,
}
