return { -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    -- "antosha417/nvim-lsp-file-operations", TODO: enable this in the future
  },
  config = function()
    local lspconfig = require("lspconfig")
    local tb = require("telescope.builtin")
    local wk = require("which-key")

    local function lsp_keymaps(bufnr)
      -- define mappings specific for LSP related items.
      wk.add({
        {
          { "<leader>l",   group = "LSP" },
          { "<leader>ld",  vim.lsp.buf.definition,              desc = "Goto Definition" },
          { "<leader>la",  vim.lsp.buf.code_action,             desc = "Code Action" },
          { "<leader>lD",  vim.lsp.buf.declaration,             desc = "Goto Declaration" },
          { "<leader>lf",  vim.lsp.buf.format,                  desc = "Format" },
          { "<leader>li",  vim.lsp.buf.implementation,          desc = "Goto Implementation" },
          { "<leader>lh",  vim.lsp.buf.hover,                   desc = "Hover" },
          { "<leader>ll",  vim.diagnostic.setloclist,           desc = "Send diagnostics to Loclist" },
          { "<leader>lq",  vim.diagnostic.setqflist,            desc = "Send diagnostics to Qflist" },
          { "<leader>lr",  tb.lsp_references,                   desc = "References" },
          { "<leader>lR",  vim.lsp.buf.rename,                  desc = "Rename in buffer" },
          { "<leader>ls",  vim.lsp.buf.signature_help,          desc = "Signature Help" },
          { "<leader>lS",  group = "Symbols" },
          { "<leader>lSd", tb.lsp_document_symbols,             desc = "Document Symbols" },
          { "<leader>lSw", tb.lsp_dynamic_workspace_symbols,    desc = "Workspace Symbols" },
          { "<leader>lo",  vim.diagnostic.open_float,           desc = "Open float with diagnostic message" },
          { "<leader>lw",  group = "Workspace" },
          { "<leader>lwa", vim.lsp.buf.add_workspace_folder,    desc = "Add Folder" },
          { "<leader>lwr", vim.lsp.buf.remove_workspace_folder, desc = "Remove Folder" },
          {
            "<leader>lwl",
            function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            desc = "List Folders",
          },
        },
        { buffer = bufnr },
      })
      wk.add({
        { "<C-s>", vim.lsp.buf.signature_help, desc = "signature help",      buffer = bufnr, mode = "i" },
        { "[d",    vim.diagnostic.goto_prev,   desc = "previous diagnostic", buffer = bufnr, mode = "n" },
        { "]d",    vim.diagnostic.goto_next,   desc = "next diagnostic",     buffer = bufnr, mode = "n" },
      })
      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer with LSP" })
    end

    local on_attach = function(client, bufnr)
      if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
      end
      -- require("lsp_signature").on_attach()
      lsp_keymaps(bufnr)
    end

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    -- change diagnostic sumbols in the sign column (gutter)
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    lspconfig.lua_ls.setup {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        })
      end,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          }

        }
      },
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig.pylsp.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        pylsp = { -- needs a seemingly redundant pylsp key, see https://vi.stackexchange.com/a/39768/32018
          plugins = {
            jedi_completion = { include_params = true },
            pycodestyle = { enabled = false },
          },
        },
      }
    }

    lspconfig.eslint.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig.biome.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig.volar.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig.vuels.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig.jsonls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = require("panos.plugins.lsp.settings.jsonls"),
    }

    lspconfig.clangd.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = require("panos.plugins.lsp.settings.clangd"),
    }

    lspconfig.texlab.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = require("panos.plugins.lsp.settings.texlab"),
    }

    lspconfig.rust_analyzer.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        checkOnSave = {
          command = "clippy",
        },
      },
    }
  end,

}
