return {
  "williamboman/mason.nvim",
  event = "LazyFile",
  dependencies = {
    { "folke/neodev.nvim", opts = {} },
    { "folke/neoconf.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "single",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        -- "tailwindcss",
        -- "svelte",
        "lua_ls",
        -- "graphql",
        "emmet_ls",
        -- "prismals",
        "pyright",
      },
      automatic_installation = true, -- not the same as ensure_installed
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
      },
    })

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
}
