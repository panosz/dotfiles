-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  eslint = {},
  rome = {},
  volar = {},
  vuels = {},
  pylsp = {},
  jsonls = require("panos.lsp.settings.jsonls"),
  clangd = {},
  pyright = {
    settings = {

      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "off"
        }
      }
    },

  },
  texlab = {
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false,
          onSave = false
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = false
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          -- executable = "okular",
          -- args = { "--unique", "file:%p#src:%l%f" },
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false
        },
      }
    }

  },
  cmake = {},
  ltex = {},
  html = {},
  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      completion = {
        callSnippet = "Replace"
      },
    },
  },
}


-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local handlers = require("panos.lsp.handlers")

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = handlers.capabilities,
      on_attach = handlers.on_attach,
      settings = servers[server_name],
    }
  end,
}
