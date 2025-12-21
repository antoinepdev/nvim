return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "digital-brain",
        path = os.getenv("OBSIDIAN_VAULT_PATH"),
      },
    },
  },
}
