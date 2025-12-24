return {
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  config = function()
    require("mason").setup()

    require("mason-tool-installer").setup({
      ensure_installed = {
        "typescript-language-server",
        "json-lsp",
      },
      -- auto_update = true,
    })
  end,
}
