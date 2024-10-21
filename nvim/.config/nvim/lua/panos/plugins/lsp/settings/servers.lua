return {
  eslint = {},
  biome = {},
  volar = {},
  pylsp = {},
  vuels = {},
  jsonls = require("panos.plugins.lsp.settings.jsonls"),
  clangd = require("panos.plugins.lsp.settings.clangd"),
  -- pyright = require("panos.lsp.settings.pyright"),
  texlab = require("panos.plugins.lsp.settings.texlab"),
  -- ltex = {
  -- root_dir = function(fname)
  -- return require("lspconfig").util.find_git_ancestor(fname)
  -- end,
  -- enabled = {latex = "latex", "tex", "bib"},
  -- },
  rust_analyzer = {},
}
