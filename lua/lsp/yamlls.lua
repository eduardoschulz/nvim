return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yml' },
  settings = {
    yaml = {
      schemaStore = { enable = false, url = '' },
      schemas = {
        kubernetes = { '*.yaml', '*.yml' },
      },
    },
  },
}
