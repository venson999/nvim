return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  main = "ibl",
  opts = {
    exclude = {
      filetypes = {
        "alpha",
        "dashboard",
        "terminal",
        "help",
        "log",
        "markdown",
        "TelescopePrompt",
        "lsp-installer",
        "lspinfo",
      },
    },
  },
}
