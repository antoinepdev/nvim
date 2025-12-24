return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
        "bash",
        "javascript",
        "json",
      },
      -- Automatically install missing parsers when entering buffer
      auto_install = false,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Tab>",
          node_incremental = "<Tab>",
          node_decremental = "<S-Tab>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["a="] = "@assignment.outer",
            ["i="] = "@assignment.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = { ["<leader>s"] = "@parameter.inner" },
          swap_previous = { ["<leader>S"] = "@parameter.inner" },
        },
      },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },
}
