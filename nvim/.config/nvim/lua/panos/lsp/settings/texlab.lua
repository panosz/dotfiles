return {
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
}
