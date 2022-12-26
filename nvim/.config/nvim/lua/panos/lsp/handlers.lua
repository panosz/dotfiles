local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    source=true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = true,
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local nmap = function(bufnr, keys, func, desc)
-- us more easily define mappings specific for LSP related items. Inspired by kickstart.nvim 
  if desc then
    desc = 'LSP: ' .. desc
  end

  local opts = {
    buffer = bufnr,
    desc = desc,
    noremap = true,
    silent = true
  }

  vim.keymap.set('n', keys, func, opts)

end

local tb = require("telescope.builtin")

local function lsp_keymaps(bufnr)
  nmap(bufnr, "gD", vim.lsp.buf.declaration, "Goto Declaration")
  nmap(bufnr, "gd", vim.lsp.buf.definition, "Goto Definition")
  nmap(bufnr, "K", vim.lsp.buf.hover, "Hover documentation")
  nmap(bufnr, "gi", vim.lsp.buf.implementation, "Goto implementation")
  nmap(bufnr, "gs", vim.lsp.buf.signature_help, "signature help")
  nmap(bufnr, "<leader>rn", vim.lsp.buf.rename, "buf rename")
  nmap(bufnr, "<leader>ca", vim.lsp.buf.code_action, "buf code action")
  nmap(bufnr, "[d", vim.diagnostic.goto_prev, "goto previous diagnostic")
  nmap( bufnr, "gl", vim.diagnostic.open_float, "open float with diagnostic message")
  nmap(bufnr, "]d", vim.diagnostic.goto_next, "goto next diagnostic")
  nmap(bufnr, "<LocalLeader>q", vim.diagnostic.setloclist, "send diagnostics to local list")

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

end

local function telescope_lsp_keymaps(bufnr)
  nmap(bufnr, "gr", tb.lsp_references, "buf references")
  nmap(bufnr, '<leader>ds', tb.lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap(bufnr, '<leader>ws', tb.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  require "lsp_signature".on_attach()
  lsp_keymaps(bufnr)
  telescope_lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
