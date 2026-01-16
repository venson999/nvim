vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
  callback = function(event)
    local bufnr = event.buf
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if not client then
      return
    end

    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Navigation
    map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
    map("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
    map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
    map("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
    map("n", "gO", vim.lsp.buf.document_symbol, { desc = "Document symbols" })

    -- Documentation and help
    map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
    map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
    map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

    -- Code actions
    map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
    map("x", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions (range)" })

    -- Diagnostic navigation
    map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    -- stylua: ignore start
    map("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Previous error" })
    map("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Next error" })
    map("n", "[w", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })  end, { desc = "Previous warning" })
    map("n", "]w", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })  end, { desc = "Next warning" })
    -- stylua: ignore end
    map("n", "<leader>xd", vim.diagnostic.open_float, { desc = "Open diagnostics float" })

    -- Workspace management
    map("n", "<leader>Wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
    map("n", "<leader>Wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
    map("n", "<leader>Wl", vim.lsp.buf.list_workspace_folders, { desc = "List workspace folders" })

    -- Advanced features: highlight references on cursor hold
    if client:supports_method("textDocument/documentHighlight") then
      local highlight_augroup = vim.api.nvim_create_augroup("user_lsp_document_highlight", { clear = true })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = bufnr,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- Inlay hints support
    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})

-- Diagnostic configuration
vim.diagnostic.config({
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "⚠",
      [vim.diagnostic.severity.HINT] = "⚡",
      [vim.diagnostic.severity.INFO] = "ⓘ",
    },
  },
  virtual_text = {
    source = true,
    spacing = 4,
  },
  underline = true,
})
