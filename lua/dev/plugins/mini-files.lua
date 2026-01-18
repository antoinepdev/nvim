return {
  "nvim-mini/mini.files",
  version = false,
  opts = {
    -- Customization of shown content
    content = {
      filter = function(fs_entry)
        -- exculuded folders
        local excluded = {
          "node_modules",
          ".obsidian",
          ".git",
          "dist",
          "build",
          ".vscode",
        }

        for _, exclude in ipairs(excluded) do
          if fs_entry.name == exclude then return false end
        end

        -- exculude hidden files
        if string.sub(fs_entry.name, 1, 1) == "." then return false end

        return true
      end,
      -- Highlight group to use for a file system entry
      highlight = nil,
      -- Prefix text and highlight to show to the left of file system entry
      prefix = nil,
      -- Order in which to show file system entries
      sort = nil,
    },

    -- Module mappings created only inside explorer.
    -- Use `''` (empty string) to not create one.
    mappings = {
      close = "q",
      go_in = "l",
      go_in_plus = "L",
      go_out = "h",
      go_out_plus = "H",
      mark_goto = "'",
      mark_set = "m",
      reset = "<BS>",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "=",
      trim_left = "<",
      trim_right = ">",
    },

    -- General options
    options = {
      -- Whether to delete permanently or move into module-specific trash
      permanent_delete = true,
      -- Whether to use for editing directories
      use_as_default_explorer = true,
    },

    -- Customization of explorer windows
    windows = {
      -- Maximum number of windows to show side by side
      max_number = math.huge,
      -- Whether to show preview of file/directory under cursor
      preview = true,
      -- Width of focused window
      width_focus = 50,
      -- Width of non-focused window
      width_nofocus = 15,
      -- Width of preview window
      width_preview = 25,
    },
  },
  keys = {
    {
      "<leader>ee",
      function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end,
      desc = "Explore current directory",
    },
    {
      "<leader>en",
      function()
        require("mini.files").open(os.getenv("NOTES_VAULT_PATH"), true)
      end,
      desc = "Explore notes vault",
    },
    {
      "<leader>ec",
      function() require("mini.files").open(vim.fn.stdpath("config"), true) end,
      desc = "Explore config files",
    },
  },
}
