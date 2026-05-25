return {
  cmd = { 'pyright' },
  filetypes = { 'python' },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'off',
        diagnosticMode = 'openFilesOnly',
        autoImportCompletions = false,
      },
    },
  },
}
