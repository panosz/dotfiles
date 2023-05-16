local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn",  text = "" },
    { name = "DiagnosticSignHint",  text = "" },
    { name = "DiagnosticSignInfo",  text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    source = true,
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
    focus = false,
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
  -- define mappings specific for LSP related items. Inspired by kickstart.nvim
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

local imap = function(bufnr, keys, func, desc)
  -- define mappings specific for LSP related items. Inspired by kickstart.nvim
  if desc then
    desc = 'LSP: ' .. desc
  end

  local opts = {
    buffer = bufnr,
    desc = desc,
    noremap = true,
    silent = true
  }

  vim.keymap.set('i', keys, func, opts)
end


local tb = require("telescope.builtin")
local wk = require("which-key")

local function lsp_keymaps(bufnr)
  -- define mappings specific for LSP related items.
  wk.register({
    ["<leader>l"] = {
      name = "LSP",
      a = { vim.lsp.buf.code_action, "Code Action" },
      d = { vim.lsp.buf.definition, "Goto Definition" },
      D = { vim.lsp.buf.declaration, "Goto Declaration" },
      f = { vim.lsp.buf.format, "Format" },
      i = { vim.lsp.buf.implementation, "Goto Implementation" },
      h = { vim.lsp.buf.hover, "Hover" },
      l = { vim.diagnostic.setloclist, "Send diagnostics to Loclist" },
      q = { vim.diagnostic.setqflist, "Send diagnostics to Qflist" },
      r = { tb.lsp_references, "References"},
      R = { vim.lsp.buf.rename, "Rename in buffer" },
      s = { vim.lsp.buf.signature_help, "Signature Help" },
      S = {
        name = "Symbols",
        d = { tb.lsp_document_symbols, "Document Symbols" },
        w = { tb.lsp_dynamic_workspace_symbols, "Workspace Symbols" },
      },
      o = { vim.diagnostic.open_float, "Open float with diagnostic message" },
      w = {
        name = "Workspace",
        a = { vim.lsp.buf.add_workspace_folder, "Add Folder" },
        r = { vim.lsp.buf.remove_workspace_folder, "Remove Folder" },
        l = { function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "List Folders" },
      },
    },
    { buffer = bufnr }
  }
  )

  wk.register( {
    ["<C-s>"]= {vim.lsp.buf.signature_help, "signature help", buffer=bufnr, mode='i'},
    ["[d"]= {vim.diagnostic.goto_prev, "previous diagnostic", buffer=bufnr, mode='n'},
    ["]d"]= {vim.diagnostic.goto_next, "next diagnostic", buffer=bufnr, mode='n'},
  })
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end


M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
  -- require "lsp_signature".on_attach()
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
