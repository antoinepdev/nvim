return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'master',
    lazy = false,
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        'lua',
        'markdown',
        'markdown_inline',
      },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<Tab>',
          node_incremental = '<Tab>',
          node_decremental = '<S-Tab>',
        },
      },
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
  },
}
