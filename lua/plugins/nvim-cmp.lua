return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-cmdline", -- source for command line
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      -- completion = {
      --   completeopt = "menu,menuone,preview,noselect",
      -- },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<cr>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<S-tab>"] = cmp.mapping.select_prev_item(),
        ["<down>"] = cmp.mapping.select_next_item(),
        ["<up>"] = cmp.mapping.select_prev_item(),
        --   ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --       return cmp.select_next_item()
        --     elseif luasnip.expand_or_jumpable() then
        --       return luasnip.expand_or_jump()
        --     end
        --     fallback()
        --   end, { "i", "s" }),
        --   ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --       return cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --       luasnip.jump(-1)
        --     end
        --     fallback()
        --   end, { "i", "s" }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          before = function(entry, vim_item)
            vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
            return vim_item
          end,
        }),
      },
    })
    -- Set configuration for specific filetype.
    -- cmp.setup.filetype("gitcommit", {
    --   sources = cmp.config.sources({
    --     { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    --   }, {
    --     { name = "buffer" },
    --   }),
    -- })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "cmdline" },
      }, {
        { name = "path" },
      }),
    })
  end,
}
